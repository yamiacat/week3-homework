require_relative("../db/sql_runner.rb")
require_relative("./album.rb")

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @name = details['name']
  end

def save()
  sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *;"
  returned_result = SqlRunner.run(sql)
  @id = returned_result.first()['id'].to_i()
end

def update()
  sql = "UPDATE artists SET (
  name)
  = ( '#{@name}')
  WHERE id = #{@id}"
  SqlRunner.run(sql)
end

def Artist.all()
  sql = "SELECT * FROM artists;"
  artists_hashes = SqlRunner.run(sql)
  return artists_hashes.map {|artist| Artist.new(artist)}
end

def Artist.delete_all
  sql = "DELETE FROM artists;"
  SqlRunner.run(sql)
end

def list_albums
  sql = "SELECT * FROM albums WHERE album_artist = #{@id}"
  album_hashes = SqlRunner.run(sql)
  return album_hashes.map {|album| Album.new(album)}
end



end
