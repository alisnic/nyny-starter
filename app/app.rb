require 'nyny'
require 'bundler'
Bundler.require(:default, NYNY.env.to_sym)

class App < NYNY::App
  register Sprockets::NYNY

  configure do
    config.database = {
      :adapter => "sqlite3",
      :database => File.join(File.dirname(__FILE__), "../db/#{NYNY.env}.sqlite3")
    }
  end

  after_initialize do
    ActiveRecord::Base.establish_connection config.database
  end
end
