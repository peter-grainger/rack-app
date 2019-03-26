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

run RackApp.new