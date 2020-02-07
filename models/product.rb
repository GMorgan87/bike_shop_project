require_relative('../db/sql_runner')

class Product

  attr_reader :id
  attr_accessor :name, :description, :buy_cost, :sell_price, :manufacturer_id, :category_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @buy_cost = options['buy_cost']
    @sell_price = options['sell_price']
    @manufacturer_id = options['manufacturer_id']
    @category_id = options['category_id']
  end

  def save
    sql = "INSERT INTO products
      ( name,
        description,
        buy_cost,
        sell_price,
        manufacturer_id,
        category_id
        )
        VALUES
        ($1, $2, $3, $4, $5, $6)
        RETURNING id"
    values = [@name,@description, @buy_cost, @sell_price, @manufacturer_id, @category_id]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def update
    sql = "UPDATE products SET
      (name,
      description,
      buy_cost,
      sell_price,
      manufacturer_id,
      category_id)
       =
      ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@name, @description, @buy_cost, @sell_price, @manufacturer_id, @category_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM products"
    results = SqlRunner.run(sql)
    products = results.map {|data| Product.new(data)}
    return products
  end

end
