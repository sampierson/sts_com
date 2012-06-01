
#task(:demo)       { @environment = 'demo' }
task(:production) { @environment = 'production' }

#desc "Usage: rake demo|production deploy  - deploy the application"
desc "Usage: rake production deploy  - deploy the application"
task :deploy => %w{
    deploy:check_environment
    deploy:push
    deploy:autotag
    deploy:migrate
    deploy:restart
  }

namespace :deploy do
  task :check_environment do
    raise "Usage: rake <environment> deploy" unless %w{production}.include?(@environment)
  end

  task :push do
    execute "git push #{git_remote}"
  end

  task :autotag do
    execute "git tag #{@environment}/#{Time.now.utc.strftime('%Y%m%d%H%M%S')} && git push origin --tags"
  end

  task :migrate do
    heroku "run rake db:migrate"
  end

  task :restart do
    heroku "restart"
  end

  task :clear_airbrake_errors do
    execute "rake airbrake:deploy TO=#{@environment}"
  end
end

def git_remote
  #@environment
  'heroku'
end

def heroku_app
  "sts-#{@environment}"
end

def heroku(command)
  execute "heroku #{command} --app #{heroku_app}"
end
