require_relative './config/environment'

if ActiveRecord::Migration.needs_migration?
  raise 'Migrations are pending, run rake db:migrate'
end

use Rack::MethodOverride
run ApplicationController
