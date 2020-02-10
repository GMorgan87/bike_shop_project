get '/manufacturers' do
  @manufacturers = Manufacturer.all
  erb(:"manufacturers/index")
end

get '/manufacturers/:id' do
  @manufacturer = Manufacturer.find(params[:id].to_i)
  @products = @manufacturer.products
  erb( :"manufacturers/show" )
end

post '/manufacturers/:id/delete' do
  manufacturer = Manufacturer.find( params[:id] )
  manufacturer.delete()
  redirect to '/manufacturers'
end
