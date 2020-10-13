require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use SessionsController
use ProductsController
use OrdersController
use UsersController
use Rack::MethodOverride
run ApplicationController
