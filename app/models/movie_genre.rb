class MovieGenre
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods

  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    movie_id: "INTEGER",
    genre_id: "INTEGER"
  }

  attr_accessor(*self.public_attributes)
  attr_reader :id

  def movie
    sql = <<-SQL
    SELECT movies.* FROM movies
    WHERE movies.id = ?
    SQL
    self.class.db.execute(sql, self.movie_id)
  end

  def genre
    sql = <<-SQL
    SELECT genres.* FROM genres
    WHERE genres.id = ?
    SQL
    self.class.db.execute(sql, self.genre_id)
  end
end
