class Review
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods

  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    content: "TEXT",
    movie_id: "INTEGER"
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

end
