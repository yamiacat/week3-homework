require_relative("../db/sql_runner")

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


end
