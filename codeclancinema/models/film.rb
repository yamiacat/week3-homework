require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :certificate

  def initialize(details)
    @id = details['id'].to_i
    @title = details['title']
    @certificate = details['certificate']
  end

  def save()
    sql = "INSERT INTO films (title, certificate) VALUES ('#{@title}', '#{@certificate}') RETURNING id;"
    returned_result = SqlRunner.run(sql)
    @id = returned_result.first()['id'].to_i
  end

  def Film.delete_all()
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def Film.all
    sql = "SELECT * FROM films;"
    returned_result = SqlRunner.run(sql)
    return returned_result.map{|film| Film.new(film)}
  end


  
end
