class Customer

   attr_reader :id
   attr_accessor :name, :funds, :age

  def initialize(details)
    @id = details['id'].to_i
    @name = details['name']
    @funds = details['funds'].to_i
    @age = details['age'].to_i
  end

end
