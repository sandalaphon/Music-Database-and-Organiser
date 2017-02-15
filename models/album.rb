class Album
attr_accessor :name, :year, :genre
attr_reader :id, :artist_id
def initialize( options )
@name=options['name']
@id = options['id'].to_i if options['id']
@year=options['year'].to_i
@genre=options['genre']
@artist_id = options['artist_id'].to_i
end

def save()
  sql = "INSERT INTO albums (name, year, genre, artist_id) 
  VALUES ('#{@name}', '#{year}', '#{@genre}', '#{@artist_id}') RETURNING *;"
  return_array_hash=SqlRunner.run(sql)
  @id = return_array_hash[0]['id'].to_i
end










end