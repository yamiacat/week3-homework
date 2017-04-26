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

def Album.find(id)
  sql = "SELECT * FROM albums WHERE id = #{id}"
  results = SqlRunner.run(sql)
  return Album.new(results[0])
end

def update()
  sql = "UPDATE albums SET (
  title, genre, album_artist)
  = ( '#{@title}', '#{@genre}', #{@album_artist})
  WHERE id = #{@id}"
  SqlRunner.run(sql)
end

def Album.delete_all
  sql = "DELETE FROM albums;"
  SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM albums WHERE id = #{@id}"
  SqlRunner.run(sql)
end

def artist
  sql = "SELECT * FROM artists WHERE id = #{@album_artist}"
  returned_artist = SqlRunner.run(sql)
  return Artist.new(returned_artist[0])
end



end
