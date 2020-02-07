require_relative('../db/sql_runner')

class Stock

  def initialize(options)
    @product_id = options['product_id']
    @quantity = options['quantity']
  end

end
