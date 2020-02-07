require_relative('../db/sql_runner')

class Category

  attr_reader :id, :name

  def initialize(options)
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
