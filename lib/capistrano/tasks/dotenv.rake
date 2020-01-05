namespace :dotenv do
  desc 'Dotenv upload .env'
  task :upload do
    on roles(:web, :app, :worker) do
      dotenv = fetch(:dotenv, '')
      upload! StringIO.new(dotenv), release_path.join('.env')
    end
  end

  desc 'Dotenv show variables'
  task :show_vars do
    puts fetch(:dotenv, '')
  end
end
