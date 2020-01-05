namespace :sidekiq do
  %i[start stop restart].each do |action|
    desc "Sidekiq #{action}"
    task action do
      on roles(:worker) do
        sudo :systemctl, action, :sidekiq
        execute :sleep, 5 if action != :stop
      end
    end
  end

  desc 'Sidekiq quiet'
  task :quiet do
    on roles(:worker) do
      if test("[ -s #{shared_path}/tmp/pids/sidekiq.pid ]")
        sudo "kill -USR1 \"$(cat #{shared_path}/tmp/pids/sidekiq.pid)\""
      end
    end
  end

  %i[monitor unmonitor].each do |action|
    desc "Sidekiq #{action}"
    task action do
      on roles(:worker) do
        sudo :monit, action, :sidekiq
      end
    end
  end
end
