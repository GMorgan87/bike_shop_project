require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/category')
require_relative('./models/manufacturer')
require_relative('./models/product')
also_reload('../models/*')
require_relative('controllers/categories_controller')
require_relative('controllers/manufacturers_controller')
require_relative('controllers/products_controller')

get '/' do
  erb( :index )
end
