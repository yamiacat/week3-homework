require_relative("../db/sql_runnner.rb")
require_relative("./artist.rb")

class Album

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @title = details['title']
    @genre = details['genre']
  end

def save()
  sql = "INSERT INTO albums (title, genre) VALUES ('#{@title}', '#{@genre}') RETURNING *;"






end
