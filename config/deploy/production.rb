server 'vkh.novahub.vn', port: 22, roles: %w{docker}, primary: true

namespace :custom do
  task :setup_container do
    on roles(:docker) do |host|
      execute "cp #{deploy_to}/shared/config/database.yml #{deploy_to}/current/config/"
      puts "================Load Ruby on Rails, migrate DB then start server===================="
      execute "source ~/.bash_profile && cd #{deploy_to}/current && bundle exec rake db:migrate && bundle exec pumactl -F config/puma.rb restart"
    end
  end
end

after "deploy:finishing", "custom:setup_container"
      