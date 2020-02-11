require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/category')
require_relative('./models/manufacturer')
require_relative('./models/product')
require_relative('./models/stock')
require_relative('controllers/categories_controller')
require_relative('controllers/manufacturers_controller')
require_relative('controllers/products_controller')
also_reload('../models/*')
also_reload('../public/style.css')

get '/' do
  erb( :index )
end
