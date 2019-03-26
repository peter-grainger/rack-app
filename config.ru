require 'bundler/setup'
Bundler.require(:default)

require_relative 'lib/rack_app'

puts ''
puts '-' * 50
puts 'SETTINGS'.center(50)
puts "RACK_ENV=#{ENV['RACK_ENV']}"
puts '-' * 50
puts ''

# Reload files on every request
use(Rack::Reloader, 0) if ENV.fetch('RACK_ENV') == 'development'

# We pass the class here and let each request create
# a new instance to isolate memory per request.
run RackApp