get '/manufacturers' do
  @manufacturers = Manufacturer.all
  erb(:"manufacturers/index")
end

get '/manufacturers/new' do
  erb(:"manufacturers/new")
end

get '/manufacturers/:id' do
  @manufacturer = Manufacturer.find(params[:id].to_i)
  @products = @manufacturer.products
  erb( :"manufacturers/show" )
end

get '/manufacturers/:id/edit' do
  @manufacturer = Manufacturer.find(params[:id].to_i)
  erb(:"manufacturers/edit")
end

post '/manufacturers' do
  Manufacturer.new(params).save
  redirect to '/manufacturers'
end

post '/manufacturers/:id/delete' do
  manufacturer = Manufacturer.find( params[:id] )
  manufacturer.delete()
  redirect to '/manufacturers'
end

post '/manufacturers/:id' do
  manufacturer = Manufacturer.new(params)
  manufacturer.update
  redirect to "/manufacturers/#{params['id']}"
end
