require "rspec/core/rake_task"
require "active_record"

RSpec::Core::RakeTask.new(:spec)

task :default => %w(db:do_over spec)

namespace :db do
  task :create do
    connection.execute "CREATE DATABASE activerecord_postgresql_citext"
  end

  task :drop do
    connection.execute "DROP DATABASE IF EXISTS activerecord_postgresql_citext"
  end

  def connection
    config = {
      :adapter => 'postgresql',
      :template => 'template0',
      :schema_search_path => 'public',
      :username => ENV["DB_USERNAME"] || ENV["USER"],
      :password => ENV["DB_PASSWORD"],
      :host => 'localhost',
      :port => ENV["DB_PORT"] || 5433
    }
    ActiveRecord::Base.establish_connection(config.merge('database' => 'postgres', 'schema_search_path' => 'public'))
    ActiveRecord::Base.connection
  end

  task :do_over => %w(drop create)
end
