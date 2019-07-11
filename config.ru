require_relative './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending, run rake db:migrate'
end

use Rack::MethodOverride
use UserController
use GamesController
use PostController
use GenresController
run ApplicationController
