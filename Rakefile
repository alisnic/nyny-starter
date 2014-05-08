require 'sprockets/nyny'
require_relative 'app/app'
require 'yaml'
require 'logger'

MIGRATIONS_DIR = 'db/migrate'

Sprockets::NYNY.load_tasks(App)

task :environment do
  App.new #=> needed for the the hooks to run, add your env logic below
end

task :console => :environment do
  require 'irb'
  ARGV.shift
  IRB.start
end

namespace :db do
  task :env do
    DATABASE_ENV = NYNY.env
    App.new
  end

  task :migrate => :env do
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate MIGRATIONS_DIR, ENV['VERSION'] ? ENV['VERSION'].to_i : nil
  end

  task :rollback => :env do
    init_connection
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    ActiveRecord::Migrator.rollback MIGRATIONS_DIR, step
  end

  task :version => :env do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end

  task :create_migration do
    name = ENV['NAME']
    abort("no NAME specified. use `rake db:create_migration NAME=create_users`") if !name

    migrations_dir = File.join("db", "migrate")
    version = ENV["VERSION"] || Time.now.utc.strftime("%Y%m%d%H%M%S")
    filename = "#{version}_#{name}.rb"
    migration_name = name.gsub(/_(.)/) { $1.upcase }.gsub(/^(.)/) { $1.upcase }

    FileUtils.mkdir_p(migrations_dir)

    open(File.join(migrations_dir, filename), 'w') do |f|
      f << (<<-EOS).gsub("      ", "")
      class #{migration_name} < ActiveRecord::Migration
        def self.up
        end

        def self.down
        end
      end
      EOS
    end
  end
end
