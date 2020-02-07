require_relative('../db/sql_runner')

class Category

  attr_reader :id, :name

  def initialize(options)
    @name = options['name']
  end

end
