class Movie
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods

  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    title: "TEXT",
    release_year: "INTEGER"
    }

  attr_accessor(*self.public_attributes)
  attr_reader :id

  def self.by_year(year)
    sql = <<-SQL
    SELECT * FROM movies
    WHERE release_year = ?
    SQL
    self.class.db.execute(sql, year)
  end

  def genres
    sql = <<-SQL
    SELECT genres.* FROM genres
    INNER JOIN moviegenres
    ON moviegenres.genre_id = genres.id
    WHERE moviegenres.movie_id = ?
    SQL
    self.class.db.execute(sql, self.id)
  end


end
