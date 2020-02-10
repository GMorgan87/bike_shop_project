require_relative('../db/sql_runner')
require_relative('./product')

class Manufacturer

  attr_reader :id
  attr_accessor :name, :contact_details, :logo_url

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact_details = options['contact_details']
    @logo_url = options['logo_url']
  end

  def save
    sql = "INSERT INTO manufacturers
    (name, contact_details, logo_url) VALUES ($1, $2, $3)
    RETURNING id"
    values = [@name, @contact_details, @logo_url]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def update
    sql = "UPDATE manufacturers SET
    (name, contact_details, logo_url) = ($1, $2, $3)
    WHERE id = $4"
    values = [@name, @contact_details, @logo_url, @id]
    SqlRunner.run(sql, values)
  end

  def products
    sql = "SELECT * FROM products
           WHERE manufacturer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|data| Product.new(data)}
  end

  def self.find(id)
    sql = "SELECT * FROM manufacturers
    WHERE ID = $1"
    values= [id]
    data = SqlRunner.run(sql, values).first
    return Manufacturer.new(data)
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
