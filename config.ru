require_relative 'app/app'

use BetterErrors::Middleware if NYNY.env == 'development'
run App.new
