class Film

  attr_reader :id
  attr_accessor :title, :certificate

  def initialize(details)
    @id = details['id'].to_i
    @title = details['title']
    @certificate = details['certificate']
  end

end
