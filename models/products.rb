require_relative('../db/sql_runner')

class Product

  attr_reader :id, :name, :description, :buy_cost, :sell_price, :manufacturer_id, :category_id

  def initialize(options)
    @name = options['name']
    @description = options['description']
    @buy_cost = options['buy_cost']
    @sell_price = options['sell_price']
    @manufacturer_id = options['manufacturer_id']
    @category_id = options['category_id']
  end

end
