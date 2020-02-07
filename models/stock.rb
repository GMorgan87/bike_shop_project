require_relative('../db/sql_runner')

class Stock

  attr_reader :id, :product_id, :quantity

  def initialize(options)
    @id = options['id'].to_i if options['id']
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

  def self.delete_all()
    sql = "DELETE FROM stock"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM stock"
    results = SqlRunner.run(sql)
    stock = results.map {|data| Stock.new(data)}
    return stock
  end

end
