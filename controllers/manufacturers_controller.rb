get '/manufacturers' do
  @manufacturers = Manufacturer.all
  erb(:"manufacturers/index")
end
