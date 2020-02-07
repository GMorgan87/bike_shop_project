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

end
