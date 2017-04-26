require_relative("../db/sql_runner.rb")
require_relative("./album.rb")

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @name = details['name']
  end

def save()
  sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *;"
  returned_result = SqlRunner.run(sql)
  @id = returned_result.first()['id'].to_i()
end



end
