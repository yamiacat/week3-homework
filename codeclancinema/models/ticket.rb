class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id, :screening_id

  def initialize(details)
    @id = details['id'].to_i
    @customer_id = details['customer_id'].to_i
    @film_id = details['film_id'].to_i
    @screening_id = details['screening_id'].to_i

  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id, screening_id) VALUES (#{@customer_id}, #{@film_id}, #{@screening_id}) RETURNING id;"
    returned_result = SqlRunner.run(sql)
    @id = returned_result.first()['id'].to_i
  end


    def Ticket.delete_all()
      sql = "DELETE FROM tickets;"
      SqlRunner.run(sql)
    end


end
