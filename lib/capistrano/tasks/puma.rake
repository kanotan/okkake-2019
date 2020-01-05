namespace :puma do
  %i[start stop].each do |action|
    desc "Puma #{action}"
    task action do
      on roles(:app) do
        sudo :systemctl, action, :puma
        execute :sleep, 5 if action != :stop
      end
    end
  end

  %i[restart reload].each do |action|
    desc "Puma #{action}"
    task action do
      on roles(:app) do
        pid = File.join(current_path, 'tmp', 'pids', 'puma.pid')
        if test("[ -e #{pid} ] && kill -0 `cat #{pid}`")
          sudo :systemctl, action, :puma
          execute :sleep, 5
        else
          invoke 'puma:start'
        end
      end
    end
  end

  %i[monitor unmonitor].each do |action|
    desc "Puma #{action}"
    task action do
      on roles(:app) do
        sudo :monit, action, :puma
      end
    end
  end
end
