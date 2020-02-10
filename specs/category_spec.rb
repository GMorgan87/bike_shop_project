require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/category')
require_relative('../models/product')

class TestPetShop < Minitest::Test

  def setup

    @cat_road = Category.new('name' => 'Road')

    @product1 = Product.new(
    'name' => 'Spectral',
    'description' => "The Spectral is simply unmatched in its class […]. Handling and suspension are superb throughout the whole range.",
    'buy_cost' => 1700,
    'sell_price' => 2200,
    'manufacturer_id' => canyon.id,
    'category_id' => cat_enduro.id)

    @product2 = Product.new(
    'name' => 'Inflite',
    'description' => "Built to excel no matter the conditions, the Inflite is a thoroughbred racing machine. Fast and agile thanks to its modern geometry, our CX bike is loaded with performance features for race day and comes in both carbon and aluminium.",
    'buy_cost' => 1500,
    'sell_price' => 2000,
    'manufacturer_id' => canyon.id,
    'category_id' => cat_road.id)




  def test_get_products
    assert_equals(,cat_enduro.products)

  end

end
