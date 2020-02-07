require_relative('../db/sql_runner')

class Manufacturer

  attr_reader :id, :name, :contact_details

  def initialize(options)
    @name = options['name']
    @contact_details = options['contact_details']
  end


end
