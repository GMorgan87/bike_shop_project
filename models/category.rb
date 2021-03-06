require_relative('../db/sql_runner')
require_relative('./product')

class Category

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO categories
    (name) VALUES ($1)
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def update
    sql = "UPDATE categories SET
    name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def products
    sql = "SELECT * FROM products
            WHERE category_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    products = results.map {|data| Product.new(data)}
    return products
  end

  def delete
    sql = "DELETE FROM categories WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM categories
    WHERE ID = $1"
    values= [id]
    data = SqlRunner.run(sql, values).first
    return Category.new(data)
  end

  def self.delete_all
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM categories"
    results = SqlRunner.run(sql)
    categories = results.map {|data| Category.new(data)}
    return categories
  end


end
