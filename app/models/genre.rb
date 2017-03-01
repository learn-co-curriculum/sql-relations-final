class Genre
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods
  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    name: "TEXT",
  }

  attr_accessor(*self.public_attributes)
  attr_reader :id

  def movies
    sql = <<-SQL
    SELECT movies.* FROM movies
    INNER JOIN moviegenres
    ON moviegenres.movie_id = movies.id
    WHERE moviegenres.genre_id = ?
    SQL
    self.class.db.execute(sql, self.id)
  end
end
