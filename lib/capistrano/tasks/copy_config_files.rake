namespace :deploy do
  desc "Copy files"
  task :copy_config_files do
    on roles(:all) do |host|
       %w[ application.yml database.yml ].each do |f|
          upload! 'config/' + f , "#{fetch(:deploy_to)}/shared/config/" + f
       end
    end
  end
end