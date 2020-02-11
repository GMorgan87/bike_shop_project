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

  def add_to_stock
    Stock.new('product_id' => @id,'quantity' => 0).save
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

  def manufacturer
    sql = "SELECT name FROM manufacturers
           WHERE id = $1"
    values = [@manufacturer_id]
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
    # if results == nil
    #   return 0
    # else
    #   return results['quantity'].to_i
    # end
  end

  def brand_logo
    sql = "SELECT logo_url FROM manufacturers
           WHERE id = $1"
    values = [@manufacturer_id]
    results = SqlRunner.run(sql, values).first
    return results['logo_url']
  end

  def status
    if quantity <=  3 && quantity > 0
      return "LOW STOCK"
    elsif quantity == 0
      return "OUT OF STOCK"
    end
  end

  def stock
    sql = "SELECT * FROM stock
    WHERE product_id = $1"
    values= [@id]
    data = SqlRunner.run(sql, values).first
    return Stock.new(data)
  end

  def buy(amount)
    stock.update_quantity(amount.to_i)
  end

  def sell(amount)
    stock.update_quantity(-amount.to_i)
  end

  def delete
    sql = "DELETE FROM products WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
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

  def self.filter_manufacturer(id)
    sql = "SELECT * FROM products
           WHERE manufacturer_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results.map {|data| Product.new(data)}
  end

  def self.filter_category(id)
    sql = "SELECT * FROM products
           WHERE category_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results.map {|data| Product.new(data)}
  end

def self.filter_in_stock()
  sql = "SELECT products.* FROM products INNER JOIN stock ON stock.product_id = products.id WHERE stock.quantity > 0"
  results = SqlRunner.run(sql)
  products = results.map {|data| Product.new(data)}
  return products
end

def self.filter_out_stock()
  sql = "SELECT products.* FROM products INNER JOIN stock ON stock.product_id = products.id WHERE stock.quantity < 1"
  results = SqlRunner.run(sql)
  products = results.map {|data| Product.new(data)}
  return products
end

def self.filter_low_stock()
  sql = "SELECT products.* FROM products INNER JOIN stock ON stock.product_id = products.id WHERE stock.quantity BETWEEN 1 AND 3"
  results = SqlRunner.run(sql)
  products = results.map {|data| Product.new(data)}
  return products
end

def self.filter_stock(status)
  if status == "in"
    return self.filter_in_stock()
  end
  if status == "low"
    return self.filter_low_stock()
  end
  if status == "out"
    return self.filter_out_stock()
  end
end

  def self.all
    sql = "SELECT * FROM products"
    results = SqlRunner.run(sql)
    products = results.map {|data| Product.new(data)}
    return products
  end

end
