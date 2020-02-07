require('pry-byebug')
require_relative('../models/category')
require_relative('../models/manufacturer')
require_relative('../models/product')
require_relative('../models/stock')

Stock.delete_all()
Product.delete_all()
Manufacturer.delete_all()
Category.delete_all()

category1 = Category.new('name' => 'Road')
category1.save()
category2 = Category.new('name' => 'Gravel')
category2.save()
category3 = Category.new('name' => 'Hardtail')
category3.save()
category4 = Category.new('name' => 'Enduro')
category4.save()

manufacturer1 = Manufacturer.new(
  'name' => 'Canyon',
  'contact_details' => 'orders@canyon.com')
  manufacturer1.save()
manufacturer2 = Manufacturer.new(
  'name' => 'Cotic',
  'contact_details' => 'info@cotic.com')
  manufacturer2.save()
manufacturer3 = Manufacturer.new(
  'name' => 'Genesis',
  'contact_details' => '0800 529504')
  manufacturer3.save()

product1 = Product.new(
  'name' => 'Spectral',
  'description' => 'The Spectral is simply unmatched in its class […]. Handling and suspension are superb throughout the whole range.',
  'buy_cost' => 1700,
  'sell_price' => 2200,
  'manufacturer_id' => manufacturer1.id,
  'category_id' => category4.id)
product1.save()

stock1 = Stock.new(
  'product_id' => product1.id,
  'quantity' => 5)
stock1.save()

binding.pry
nil
