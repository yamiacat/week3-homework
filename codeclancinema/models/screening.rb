require_relative("../db/sql_runner")
require_relative("./customer.rb")
require_relative("./ticket.rb")


class Screening
  attr_reader :id
  attr_accessor :screening_date, :screening_time, :screening_film, :price, :capacity

  def initialize(details)
    @id = details['id'].to_i
    @screening_date = details['screening_date']
    @screening_time = details['screening_time']
    @screening_film = details['screening_film'].to_i
    @price = details['price'].to_i
    @capacity = details['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (screening_date, screening_time, screening_film, price, capacity) VALUES ('#{@screening_date}', '#{@screening_time}', #{@screening_film}, #{@price}, #{@capacity}) RETURNING id;"
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
    sql = "UPDATE screenings SET (screening_date, screening_time, screening_film, price, capacity) = ('#{@screening_date}', '#{@screening_time}', #{@screening_film}, #{@price}, #{@capacity}) WHERE id = #{@id}"
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

  def tickets_sold_count()
    sql = "SELECT t.* FROM tickets t INNER JOIN screenings s ON t.screening_id = s.id WHERE s.id = #{@id};"

    result_hash = SqlRunner.run(sql)

    ticket_array = result_hash.map{|ticket| Ticket.new(ticket)}

    return ticket_array.count
  end



  def Screening.screening_table()
    line_width = 60
    return_table = ["Film Title (Cert.)".ljust(line_width/2) + "Date and Time of Showing".rjust(line_width/2)]

    all_films = Screening.all

    all_films.each{|showing| return_table << "#{showing.film_title} (#{showing.film_certificate})".ljust(line_width/2) + "#{showing.screening_date}, #{showing.screening_time}".rjust(line_width/2)}

    return return_table.join("\n")


  end


end
