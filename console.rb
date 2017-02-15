require('pry')
require_relative('models/artist.rb')
require_relative('models/album.rb')

Artist.delete_all

artist1 = Artist.new({
  'name' => 'Pink Floyd'
  })
artist1.save

artist2 = Artist.new ({
  'name' => 'Metallica'
  })
artist2.save

artist3 = Artist.new ({
  'name' => 'Led Zeppelin'
  })
artist3.save


album1 = Album.new ({
  'name' => 'Dark Side of the Moon',
  'year' => '1976',
  'genre' => 'rock',
  'artist_id' => artist1.id
  })
album1.save
album2 = Album.new ({
  'name' => 'Zeppelin',
  'year' => '1977',
  'genre' => 'rock',
  'artist_id' => artist3.id
  })
album2.save
album3 = Album.new ({
  'name' => 'Ride the Lightning',
  'year' => '1984',
  'genre' => 'hard rock',
  'artist_id' => artist2.id
  })
album3.save

binding.pry
nil