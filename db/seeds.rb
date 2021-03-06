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
  'logo_url' => 'canyon_logo.png')
canyon.save()
cotic = Manufacturer.new(
  'name' => 'Cotic',
  'contact_details' => 'info@cotic.com',
  'logo_url' => 'cotic_logo.png')
cotic.save()
genesis = Manufacturer.new(
  'name' => 'Genesis',
  'contact_details' => '0800 529504',
  'logo_url' => 'genesis_logo.png')
genesis.save()
cannondale = Manufacturer.new(
  'name' => 'Cannondale',
  'contact_details' => 'orders@cannondale.com',
  'logo_url' => 'cannondale_logo.jpg')
cannondale.save()
cube = Manufacturer.new(
  'name' => 'Cube',
  'contact_details' => 'info@cube.com',
  'logo_url' => 'cube_logo.jpg')
cube.save()
trek = Manufacturer.new(
  'name' => 'Trek',
  'contact_details' => 'orders@trek.com',
  'logo_url' => 'trek_logo.jpg')
trek.save()



product1 = Product.new(
  'name' => 'Spectral',
  'description' => "The Spectral is simply unmatched in its class […]. Handling and suspension are superb throughout the whole range.",
  'buy_cost' => 1700,
  'sell_price' => 2200,
  'manufacturer_id' => canyon.id,
  'category_id' => cat_enduro.id)
product1.save()

product2 = Product.new(
  'name' => 'Inflite',
  'description' => "Built to excel no matter the conditions, the Inflite is a thoroughbred racing machine. Fast and agile thanks to its modern geometry, our CX bike is loaded with performance features for race day and comes in both carbon and aluminium.",
  'buy_cost' => 1500,
  'sell_price' => 2000,
  'manufacturer_id' => canyon.id,
  'category_id' => cat_road.id)
product2.save()

product3 = Product.new(
  'name' => 'Ultimate',
  'description' => "The Ultimate is regarded as one of the best road bikes in the world and for years has represented the pinnacle of Canyon road bike technology.",
  'buy_cost' => 2750,
  'sell_price' => 3250,
  'manufacturer_id' => canyon.id,
  'category_id' => cat_road.id)
product3.save()

product4 = Product.new(
  'name' => 'Grail',
  'description' => "Gravel. All road. New road.The Grail finds the sweet spot between speed and comfort to blow the potential of what, where and how you ride wide open.",
  'buy_cost' => 1200,
  'sell_price' => 1550,
  'manufacturer_id' => canyon.id,
  'category_id' => cat_gravel.id)
product4.save()

product5 = Product.new(
  'name' => 'Grand Canyon',
  'description' => "This bike brings together a high-end aluminium frame with a plush 120 mm of travel, wide rims and tyres, and a simple-to-use 1x drivetrain.",
  'buy_cost' => 900,
  'sell_price' => 1100,
  'manufacturer_id' => canyon.id,
  'category_id' => cat_hardtail.id)
product5.save()

product6 = Product.new(
  'name' => 'Sender',
  'description' => "From the Downhill World Cup’s most technical courses to the most extreme freeride tracks in the Utah desert: to compete against the best, you need the best bike.",
  'buy_cost' => 2750,
  'sell_price' => 3500,
  'manufacturer_id' => canyon.id,
  'category_id' => cat_downhill.id)
product6.save()

product7 = Product.new(
  'name' => 'CAAD',
  'description' => "Created using Cannondale’s Tube Flow Modeling design process, CAAD Optimo’s SmartForm C2 Aluminium construction is lighter and has a better ride-feel than many of our competitors’ premium alloy offerings.",
  'buy_cost' => 550,
  'sell_price' => 700,
  'manufacturer_id' => cannondale.id,
  'category_id' => cat_road.id)
product7.save()

product8 = Product.new(
  'name' => 'Synapse',
  'description' => "Built for big rides and long days in the saddle, the Synapse offers full race performance, allday geometry, wide-ranging capabilities and a micro-suspension system that insulates you from the bumps without isolating you from the experience.",
  'buy_cost' => 2500,
  'sell_price' => 2800,
  'manufacturer_id' => cannondale.id,
  'category_id' => cat_road.id)
product8.save()

product9 = Product.new(
  'name' => 'Stereo',
  'description' => "Big days out in the mountains place big demands on both bike and rider. Luckily the Stereo 140 HPC SL 27.5 is up for the challenge.",
  'buy_cost' => 2650,
  'sell_price' => 3000,
  'manufacturer_id' => cube.id,
  'category_id' => cat_enduro.id)
product9.save()

product10 = Product.new(
  'name' => 'BFe',
  'description' => "This is our rowdiest hardtail, it will take everything you can throw at it, from BMX track laps to the steepest downhill lines.",
  'buy_cost' => 1250,
  'sell_price' => 1600,
  'manufacturer_id' => cotic.id,
  'category_id' => cat_hardtail.id)
product10.save()

product11 = Product.new(
  'name' => 'Rocket',
  'description' => "Whether you're tackling big mountain adventures or the toughest enduro stage, the Rocket will look after you and keep you screaming for more.",
  'buy_cost' => 1250,
  'sell_price' => 1600,
  'manufacturer_id' => cotic.id,
  'category_id' => cat_enduro.id)
product11.save()

product12 = Product.new(
  'name' => 'Croix de Fer',
  'description' => "Never has one bike been more worthy of the “One bike, many hats” crown. The Croix De Fer has always been and continues to be the most supremely capable and infinitely adaptable bike Genesis make.",
  'buy_cost' => 750,
  'sell_price' => 900,
  'manufacturer_id' => genesis.id,
  'category_id' => cat_gravel.id)
product12.save()

product13 = Product.new(
  'name' => 'Delta',
  'description' => "A comfortable, practical and efficient road bike ideally suited to either newer riders looking to improve their performance or seasoned riders after a faster paced training or winter bike.",
  'buy_cost' => 700,
  'sell_price' => 800,
  'manufacturer_id' => genesis.id,
  'category_id' => cat_road.id)
product13.save()

product14 = Product.new(
  'name' => 'Session',
  'description' => "The Trek Session 9.9 has the heart of a monster truck: it rolls over everything, gives you the confidence to take on rougher trails and saves youIt's like a precision wrecking ball that gives you the confidence to tear down mountains and take the fastest, burliest lines.",
  'buy_cost' => 4500,
  'sell_price' => 5000,
  'manufacturer_id' => trek.id,
  'category_id' => cat_downhill.id)
product14.save()

stock1 = Stock.new(
  'product_id' => product1.id,
  'quantity' => 2)
stock1.save()

stock2 = Stock.new(
  'product_id' => product2.id,
  'quantity' => 3)
stock2.save()

stock3 = Stock.new(
  'product_id' => product3.id,
  'quantity' => 8)
stock3.save()

stock4 = Stock.new(
  'product_id' => product4.id,
  'quantity' => 4)
stock4.save()

stock5 = Stock.new(
  'product_id' => product5.id,
  'quantity' => 1)
stock5.save()

stock6 = Stock.new(
  'product_id' => product6.id,
  'quantity' => 7)
stock6.save()

stock7 = Stock.new(
  'product_id' => product7.id,
  'quantity' => 3)
stock7.save()

stock8 = Stock.new(
  'product_id' => product8.id,
  'quantity' => 3)
stock8.save()

stock9 = Stock.new(
  'product_id' => product9.id,
  'quantity' => 6)
stock9.save()

stock10 = Stock.new(
  'product_id' => product10.id,
  'quantity' => 9)
stock10.save()

stock11 = Stock.new(
  'product_id' => product11.id,
  'quantity' => 4)
stock11.save()

stock12 = Stock.new(
  'product_id' => product12.id,
  'quantity' => 5)
stock12.save()

stock13 = Stock.new(
  'product_id' => product13.id,
  'quantity' => 3)
stock13.save()

stock14 = Stock.new(
  'product_id' => product14.id,
  'quantity' => 5)
stock14.save()
