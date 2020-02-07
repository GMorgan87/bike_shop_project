require_relative('../models/category')
require_relative('../models/manufacturer')
require_relative('../models/product')
require_relative('../models/stock')

category1 = Category.new('name' => 'Road')
category1.save()
category2 = Category.new('name' => 'Gravel')
category2.save()
category3 = Category.new('name' => 'Hardtail')
category3.save()

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
