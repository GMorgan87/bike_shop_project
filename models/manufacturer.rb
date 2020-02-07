require_relative('../db/sql_runner')

class Manufacturer

  attr_reader :id, :name, :contact_details

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact_details = options['contact_details']
  end

  def save
    sql = "INSERT INTO manufacturers
    (name, contact_details) VALUES ($1, $2)
    RETURNING id"
    values = [@name, @contact_details]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM manufacturers"
    results = SqlRunner.run(sql)
    manufacturers = results.map {|data| Manufacturer.new(data)}
    return manufacturers
  end


end
