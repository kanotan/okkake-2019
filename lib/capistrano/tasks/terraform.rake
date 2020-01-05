require 'tempfile'

namespace :terraform do
  desc 'Terraform plan(dry-run)'
  task :plan do
    run_terraform :plan, "-var-file=#{terraform_var_file.path}"
  end

  desc 'Terraform apply'
  task :apply do
    run_terraform :apply, '-auto-approve', "-var-file=#{terraform_var_file.path}"
  end

  desc 'Terraform show'
  task :show do
    run_terraform :show
  end

  desc 'Terraform destroy'
  task :destroy do
    ask(:confirm, 'y/N')
    if fetch(:confirm).match?(/^y$/i)
      run_terraform :destroy, '-force', "-var-file=#{terraform_var_file.path}"
    else
      abort 'Canneled'
    end
  end

  desc 'Terraform show variables'
  task :show_vars do
    puts Kernel.open(terraform_var_file.path).read
  end

  def run_terraform(*args)
    run_locally do
      within './ops/terraform' do
        with_verbosity(Logger::DEBUG) do
          execute :rm, '-rf', '.terraform'
          execute :terraform, :init,
                  "-backend-config \"access_key=#{fetch(:terraform_vars)[:tf_backend_access_key]}\"",
                  "-backend-config \"secret_key=#{fetch(:terraform_vars)[:tf_backend_secret_key]}\""
          execute :terraform, :workspace, :select, fetch(:stage)
          execute :terraform, *args
        end
      end
    end
  end

  def terraform_var_file
    Tempfile.open(['terraform_vars', '.tfvars']) do |fp|
      fp.write JSON.pretty_generate(fetch(:terraform_vars))
      fp
    end
  end
end
