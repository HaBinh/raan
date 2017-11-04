server 'vkh.novahub.vn', port: 22, roles: %w{docker}, primary: true

namespace :custom do
  task :setup_container do
    on roles(:docker) do |host|
      execute "cp #{deploy_to}/shared/config/database.yml #{deploy_to}/current/config/"
      puts "================Starting Docker setup===================="
      execute "cd #{deploy_to}/current && docker stop raan_web && docker rm raan_web && docker rmi raan_web && docker-compose up"
    end
  end
end

after "deploy:finishing", "custom:setup_container"