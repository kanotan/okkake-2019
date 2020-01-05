require 'net/ssh/proxy/command'

lock '~> 3.11.2'

set :application, 'okkake'
set :repo_url, 'git@github.com:kanotan/okkake.git'
set :branch, ENV.fetch('GIT_BRANCH', 'master')

set :deploy_to, "/opt/#{fetch(:application)}"
set :linked_dirs, fetch(:linked_dirs, []) + %w[
  log tmp/pids tmp/cache tmp/sockets vendor/bundle public/sitemaps node_modules
]

set :format, :airbrussh
set :log_level, :info

# Cap EC2
# EC2一覧の取得にAWSのAPIアクセスを伴う
# 時短のため、必要のないタスクではこの処理をスキップする
set :ec2_region, %w[ap-northeast-1]
task_name = ARGV[1]
if task_name && !task_name.match?(/^(terraform:.*|.*:show_vars)$/)
  ec2_role :web
  ec2_role :app
  ec2_role :db
  ec2_role :worker
end

# NewRelic
after 'deploy:updated', 'newrelic:notice_deployment'

# Dotenv
after 'deploy:updating',  'dotenv:upload'

# Puma
after 'deploy:published', 'puma:reload'

# Sidekiq
after 'deploy:starting',  'sidekiq:quiet'
after 'deploy:updated',   'sidekiq:unmonitor'
after 'deploy:updated',   'sidekiq:stop'
after 'deploy:reverted',  'sidekiq:stop'
after 'deploy:published', 'sidekiq:start'
after 'deploy:published', 'sidekiq:monitor'
