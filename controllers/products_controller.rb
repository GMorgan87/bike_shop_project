get '/products' do
  @products = Product.all
  erb(:"products/index")
end

get '/products/:id' do
  @product = Product.find(params[:id].to_i)
  erb( :"products/show" )
end

post '/products/:id/delete' do
  product = Product.find( params[:id] )
  product.delete()
  redirect to '/products'
end
