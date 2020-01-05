require 'tempfile'

namespace :itamae do
  desc 'Itamae plan(dry-run)'
  task :plan do
    run_itamae(dry_run: true)
  end

  desc 'Itamae apply'
  task :apply do
    run_itamae(dry_run: false)
  end

  desc 'Itamae show variables'
  task :show_vars do
    puts Kernel.open(itamae_var_file.path).read
  end

  def run_itamae(dry_run:)
    on roles(:all) do |server|
      run_locally do
        options = itamae_options(server, dry_run: dry_run)
        with(ROLES: server.roles.to_a.join(',')) do
          output = capture :bundle, :exec, :itamae, :ssh, './ops/itamae/bootstrap.rb', *options
          info server
          info server.roles.to_a.join(',')
          puts output
          puts "\n"
        end
      end
    end
  end

  def itamae_options(server, dry_run:)
    ssh_options = itamae_ssh_options(server)
    options = []
    options << "--host #{server.hostname}"
    options << "--ssh-config #{ssh_options[:ssh_config_file_path]}"
    options << '--color'
    options << '--dry-run' if dry_run
    options << "--node-json #{itamae_var_file.path}"
  end

  def itamae_ssh_options(server)
    ssh_options = fetch(:ssh_options, {}).merge(server.ssh_options || {})
    ssh_options[:key] = ssh_options[:keys] && ssh_options[:keys].first
    ssh_options[:ssh_config_file_path] = ssh_config_file(ssh_options[:key], server).path
    ssh_options
  end

  def ssh_config_file(key, server)
    Tempfile.open('config') do |fp|
      fp.write <<~CONFIG
        Host #{server}
        HostName #{server}
        User ubuntu
        IdentityFile #{key}
        ProxyCommand ssh -i #{key} -W %h:%p \
                      -o UserKnownHostsFile=/dev/null \
                      -o StrictHostKeyChecking=no \
                      #{fetch(:bashion_ssh_user_host)}
      CONFIG
      fp
    end
  end

  def itamae_var_file
    @itamae_var_file ||= Tempfile.open(['itamae_vars', '.json']) do |fp|
      fp.write JSON.pretty_generate(fetch(:itamae_vars))
      fp
    end
  end
end
