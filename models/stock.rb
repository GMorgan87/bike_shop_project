require_relative('../db/sql_runner')

class Stock

  def initialize(options)
    @product_id = options['product_id']
    @quantity = options['quantity']
  end

  def save
    sql = "INSERT INTO stock
      (product_id,
       quantity)
       VALUES
       ($1, $2)
       RETURNING id"
    values = [@product_id, @quantity]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

end
