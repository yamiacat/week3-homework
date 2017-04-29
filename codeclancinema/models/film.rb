require_relative("../db/sql_runner")
require_relative("./screening.rb")

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

  def Film.all()
    sql = "SELECT * FROM films;"
    returned_result = SqlRunner.run(sql)
    return returned_result.map{|film| Film.new(film)}
  end

  def update()
    sql = "UPDATE films SET (title, certificate) = ('#{@title}', '#{@certificate}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def most_popular_screening
    sql = "SELECT s.* FROM screenings s INNER JOIN films f ON f.id = s.screening_film WHERE f.id = #{@id};"
    screenings_hash = SqlRunner.run(sql)

    screenings_array = screenings_hash.map{|screening| Screening.new(screening)}

#ZOMG THANK YOU TO EOGHAN FOR HELPING ME WITH THIS BIT
    most_popular = screenings_array.max { |a, b| a.tickets_sold_count <=> b.tickets_sold_count }

    return "The #{most_popular.screening_date}, #{most_popular.screening_time} showing is the most popular."

  end

end
