require("pry-byebug")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")

artist1 = Artist.new({
  'name' => "Have A Nice Life"
  })

artist2 = Artist.new({
  'name' => "Neutral Milk Hotel"
  })

artist3 = Artist.new({
  'name' => "Aphex Twin"
  })

artist1.save
artist2.save
artist3.save


album1 = Album.new({
  'title' => "Deathconsciousness",
  'genre' => "Blackgaze",
  'album_artist' => artist1.id
  })

album2 = Album.new({
  'title' => "On an Airplane Over The Sea",
  'genre' => "Indie-Folk",
  'album_artist' => artist2.id
  })

album3 = Album.new({
  'title' => "Selected Ambient Works Volume II",
  'genre' => "Ambient",
  'album_artist' => artist3.id
  })

album4 = Album.new({
  'title' => "Voids",
  'genre' => "Blackgaze",
  'album_artist' => artist1.id
  })

album5 = Album.new({
  'title' => "Windowlicker",
  'genre' => "IDM",
  'album_artist' => artist3.id
  })

album1.save
album2.save
album3.save
album4.save
album5.save



binding.pry
nil
