require('pry-byebug')
require_relative('../models/category')
require_relative('../models/manufacturer')
require_relative('../models/product')
require_relative('../models/stock')

Stock.delete_all()
Product.delete_all()
Manufacturer.delete_all()
Category.delete_all()

cat_road = Category.new('name' => 'Road')
cat_road.save()
cat_gravel = Category.new('name' => 'Gravel')
cat_gravel.save()
cat_hardtail = Category.new('name' => 'Hardtail')
cat_hardtail.save()
cat_enduro = Category.new('name' => 'Enduro')
cat_enduro.save()
cat_downhill = Category.new('name' => 'Downhill')
cat_downhill.save()


canyon = Manufacturer.new(
  'name' => 'Canyon',
  'contact_details' => 'orders@canyon.com',
  'logo_url' => '../public/canyon_logo')
  canyon.save()
cotic = Manufacturer.new(
  'name' => 'Cotic',
  'contact_details' => 'info@cotic.com',
  'logo_url' => '../public/cotic_logo')
  cotic.save()
genesis = Manufacturer.new(
  'name' => 'Genesis',
  'contact_details' => '0800 529504',
  'logo_url' => '../public/genesis_logo')
  genesis.save()

spectral = Product.new(
  'name' => 'Spectral',
  'description' => 'The Spectral is simply unmatched in its class […]. Handling and suspension are superb throughout the whole range.',
  'buy_cost' => 1700,
  'sell_price' => 2200,
  'manufacturer_id' => canyon.id,
  'category_id' => cat_enduro.id)
spectral.save()

stock1 = Stock.new(
  'product_id' => spectral.id,
  'quantity' => 5)
stock1.save()

binding.pry
nil
