require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/categories_controller')

get '/' do
  erb( :index )
end
