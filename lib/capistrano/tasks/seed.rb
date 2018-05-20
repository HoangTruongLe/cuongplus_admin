namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    on roles(:all) do
      within current_path do
        execute :bundle, :exec, 'rails', 'db:seed', 'RAILS_ENV=production'
      end
    end
  end
  
  desc "drop db"
  task :drop_db do
    on roles(:all) do
      within current_path do
        execute :bundle, :exec, 'rails', 'db:drop', 'RAILS_ENV=production'
      end
    end
  end
  
  desc "create db"
  task :create_db do
    on roles(:all) do
      within current_path do
        execute :bundle, :exec, 'rails', 'db:create', 'RAILS_ENV=production'
      end
    end
  end
end
