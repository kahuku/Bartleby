namespace :db do
  namespace :seed do
    desc 'Load spells data from JSON file'
    task :spells => :environment do
      load Rails.root.join('db', 'seeds', 'spells.rb')
    end

    desc 'Load charms data from JSON file'
    task :charms => :environment do
      load Rails.root.join('db', 'seeds', 'charms.rb')
    end
  end
end
