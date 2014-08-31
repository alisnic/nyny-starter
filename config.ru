require_relative 'app/app'
require 'sprockets'

use BetterErrors::Middleware

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  environment.append_path 'vendor/assets/javascripts'
  environment.append_path 'vendor/assets/stylesheets'
  run environment
end

map '/' do
  run App.new
end
