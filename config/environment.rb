ENV['SINATRA_ENV'] ||= "development"

require 'bundler'
require 'rack-flash'
Bundler.require

#ActiveRecord::Base.establish_connection(
#  :adapter => "sqlite3",
#  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
#)

configure :development do
  set :database, "sqlite3:db/development.sqlite"
end


require_all 'app'
