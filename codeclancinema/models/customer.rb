require_relative("../db/sql_runner")
require_relative("./screening.rb")

class Customer

   attr_reader :id
   attr_accessor :name, :funds, :age

  def initialize(details)
    @id = details['id'].to_i
    @name = details['name']
    @funds = details['funds'].to_i
    @age = details['age'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds, age) VALUES ('#{@name}', #{@funds}, #{@age}) RETURNING id;"
    returned_result = SqlRunner.run(sql)
    @id = returned_result.first()['id'].to_i
  end


  def Customer.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end


  def Customer.all()
    sql = "SELECT * FROM customers;"
    returned_result = SqlRunner.run(sql)
    return returned_result.map{|customer| Customer.new(customer)}
  end

  def update()
    sql = "UPDATE customers SET (name, funds, age) = ('#{@name}', #{@funds}, #{@age}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def films_booked()
    sql = "SELECT s.* FROM tickets t
    INNER JOIN screenings s ON t.screening_id = s.id WHERE t.customer_id = #{@id};"
    films_booked_array = ["#{@name} has booked"]

    returned_result = SqlRunner.run(sql)

    booked_screenings = returned_result.map {|screening| Screening.new(screening)}
    booked_screenings.each {|screening|
    films_booked_array << "#{screening.film_title} showing on #{screening.screening_date} at #{screening.screening_time}"}
    return films_booked_array.join(", ")
  end

end
