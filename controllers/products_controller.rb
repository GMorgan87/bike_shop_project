get '/products' do
  @manufacturers = Manufacturer.all
  @categories = Category.all
  @products = Product.all
  erb(:"products/index")
end

get '/products/new' do
  @manufacturers = Manufacturer.all
  @categories = Category.all
  erb(:"products/new")
end


get '/products/:id' do
  @product = Product.find(params[:id].to_i)
  erb( :"products/show" )
end

get '/products/:id/edit' do
  @manufacturers = Manufacturer.all
  @categories = Category.all
  @product = Product.find(params[:id].to_i)
  erb(:"products/edit")
end

post '/products' do
  id = Product.new(params).save
  product = Product.find(id)
  product.add_to_stock()
  redirect to '/products'
end

post '/products/:id/delete' do
  product = Product.find( params[:id] )
  product.delete()
  redirect to '/products'
end

post '/products/:id/buy' do
  product = Product.find(params[:id])
  product.buy(params[:buy_amount])
  redirect to "/products/#{params['id']}"
end

post  '/products/:id/sell' do
  product = Product.find(params[:id])
  product.sell(params[:sell_amount])
  redirect to "/products/#{params['id']}"
end

post '/products/:id' do
  product = Product.new(params)
  product.update
  redirect to "/products/#{params['id']}"
end
