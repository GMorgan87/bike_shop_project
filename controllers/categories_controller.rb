
get '/categories' do
  @categories = Category.all
  erb(:"categories/index")
end

get '/categories/:id' do
  @category = Category.find(params[:id].to_i)
  @products = @category.products
  erb( :"categories/show" )
end

get '/categories/:id/edit' do
  @category = Category.find(params[:id].to_i)
  erb(:"categories/edit")
end

post '/categories/:id/delete' do
  category = Category.find( params[:id] )
  category.delete()
  redirect to '/categories'
end


post '/categories/:id' do
  category = Category.new(params)
  category.update
  redirect to "/categories/#{params['id']}"
end
