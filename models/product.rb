require_relative('../db/sql_runner')

class Product

  attr_reader :id
  attr_accessor :name, :description, :buy_cost, :sell_price, :manufacturer_id, :category_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @buy_cost = options['buy_cost'].to_i
    @sell_price = options['sell_price'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
    @category_id = options['category_id'].to_i
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

  def brand_name
    sql = "SELECT name FROM manufacturers
           WHERE id = $1"
    values = [@manufacturer_id]
    results = SqlRunner.run(sql, values).first
    return "#{results['name']} - #{@name}"
  end

  def category
    sql = "SELECT name FROM categories
           WHERE id = $1"
    values = [@category_id]
    return SqlRunner.run(sql, values).first['name']
  end

  def profit_margin
    return @sell_price - @buy_cost
  end

  def quantity
    sql = "SELECT quantity FROM stock
           WHERE product_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values).first
    return results['quantity'].to_i
  end

  def brand_logo
    sql = "SELECT logo_url FROM manufacturers
           WHERE id = $1"
    values = [@manufacturer_id]
    results = SqlRunner.run(sql, values).first
    return results['logo_url']
  end

  def status
    if quantity <= 3
      return "low"
    elsif quantity == 0
      return "out"
    end
  end

  def self.find(id)
    sql = "SELECT * FROM products
    WHERE ID = $1"
    values= [id]
    data = SqlRunner.run(sql, values).first
    return Product.new(data)
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
