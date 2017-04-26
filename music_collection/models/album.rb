require_relative("../db/sql_runner.rb")
require_relative("./artist.rb")

class Album

  attr_reader :id
  attr_accessor :title, :genre, :album_artist

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @title = details['title']
    @genre = details['genre']
    @album_artist = details['album_artist'].to_i() if details['album_artist']
  end

def save()
  sql = "INSERT INTO albums (title, genre, album_artist) VALUES ('#{@title}', '#{@genre}', #{@album_artist}) RETURNING *;"
  returned_result = SqlRunner.run(sql)
  @id = returned_result.first()['id'].to_i()
end

def Album.all()
  sql = "SELECT * FROM albums;"
  albums_hashes = SqlRunner.run(sql)
  return albums_hashes.map {|album| Album.new(album)}
end





end
