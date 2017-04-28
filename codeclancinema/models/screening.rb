class Screening
  attr_reader :id
  attr_accessor :screening_date, :screening_time, :screening_film, :price

  def initialize(details)
    @id = details['id'].to_i
    @screening_date = details['screening_date']
    @screening_time = details['screening_time']
    @screening_film = details['screening_film']
    @price = details['price'].to_i
  end



end
