require_relative("../db/sql_runner")
require_relative("./customer.rb")


class Screening
  attr_reader :id
  attr_accessor :screening_date, :screening_time, :screening_film, :price

  def initialize(details)
    @id = details['id'].to_i
    @screening_date = details['screening_date']
    @screening_time = details['screening_time']
    @screening_film = details['screening_film'].to_i
    @price = details['price'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (screening_date, screening_time, screening_film, price) VALUES ('#{@screening_date}', '#{@screening_time}', #{@screening_film}, #{@price}) RETURNING id;"
    returned_result = SqlRunner.run(sql)
    @id = returned_result.first()['id'].to_i
  end


  def Screening.delete_all()
    sql = "DELETE FROM screenings;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = #{@id}"
    SqlRunner.run(sql)
  end


  def Screening.all()
    sql = "SELECT * FROM screenings;"
    returned_result = SqlRunner.run(sql)
    return returned_result.map{|screening| Screening.new(screening)}
  end

  def update()
    sql = "UPDATE screenings SET (screening_date, screening_time, screening_film, price) = ('#{@screening_date}', '#{@screening_time}', #{@screening_film}, #{@price}) WHERE id = #{@id}"
    return SqlRunner.run(sql)
  end

#MADE THIS GETTER TO EASILY LINK TITLES TO SCREENING
  def film_title()
    sql = "SELECT f.title FROM films f INNER JOIN screenings s ON s.screening_film = f.id WHERE s.id = #{@id};"
    result = SqlRunner.run(sql).first
    return result['title']
  end

  def film_certificate()
    sql = "SELECT f.certificate FROM films f INNER JOIN screenings s ON s.screening_film = f.id WHERE s.id = #{@id};"
    result = SqlRunner.run(sql).first
    return result['certificate']
  end

  def customers_attending()
    sql = "SELECT c.* FROM customers c INNER JOIN tickets t ON c.id = t.customer_id INNER JOIN screenings s ON t.screening_id = s.id WHERE s.id = #{@id};"

    result_hash = SqlRunner.run(sql)

    customer_array = result_hash.map{|customer| Customer.new(customer)}

    return_array = ["There are #{customer_array.count} customers booked to attend:"]

    customer_array.each{|customer| return_array << "#{customer.name}"}

    return return_array.join("\n- ")
  end




end
