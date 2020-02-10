require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/category')
also_reload('../models/*')
require_relative('controllers/categories_controller')

get '/' do
  erb( :index )
end
