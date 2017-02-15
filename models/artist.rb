require_relative('../db/sql_runner.rb')

class Artist
  attr_accessor :name
  attr_reader :id
  def initialize( options )
    @name=options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM artists;"
    artists=SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end

  def update()
  sql="UPDATE artists 
    SET (name) = ('#{@name}')
   WHERE id = #{@id};"
  SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

def album
  sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
  hashes=SqlRunner.run(sql)
  return hashes.map{|dope| Album.new(dope)}
  end


end