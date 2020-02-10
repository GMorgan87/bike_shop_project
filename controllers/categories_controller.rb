
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

end
