require("pry-byebug")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")


album1 = Album.new({
  'title' => "Deathconsciousness",
  'genre' => "Blackgaze"
  })

album2 = Album.new({
  'title' => "On an Airplane Over The Sea",
  'genre' => "Indie-Folk"
  })

album3 = Album.new({
  'title' => "Selected Ambient Works Volume II",
  'genre' => "Ambient"
  })


artist1 = Artist.new({
  'name' => "Have A Nice Life"
  })

artist2 = Artist.new({
  'name' => "Neutral Milk Hotel"
  })

artist3 = Artist.new({
  'name' => "Aphex Twin"
  })





binding.pry
nil
