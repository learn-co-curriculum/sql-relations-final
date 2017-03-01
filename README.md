# SQL Assessment

Welcome to Netflix! For this domain, we'll be modeling out movies, genres, and reviews.

## Topics / Objectives

+ Domain modelling
+ has_many / belongs_to relationships
+ SQL `Select` statements
+ SQL Joins

### Deliverables

1. As a first step, please write out the domain model in this file
   + What we are concerned about is which tables have foreign keys
   + Don't stress: There may be multiple correct answers based on your conception of the problem.

   Eg. for our books and authors your deliverable would look like

    ### books
    id | title | author_id

    ### author
    id | name |

2. As a second step, please fill in the stubbed out methods in the respective model. The important thing here is to know what SQL will fire to select the data you're looking for. For example, if I want a method called 'author' for my `Book` class, it might look something like this.

```ruby
class Book
  include Databaseable::InstanceMethods # Access to our database
  extend Databaseable::ClassMethods

  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    title: "TEXT",
    release_year: "INTEGER"
   }

  attr_accessor(*self.public_attributes)
  attr_reader :id

  def author
    sql = <<-SQL
    SELECT * FROM authors
    WHERE id = ?
    SQL
    self.class.db.execute(sql, self.author_id)
  end

end

```
  - Genre#movies
    - returns all of the movies with that given genre
  - Movie#genres
    - returns all of the genres for that given movie
  - Movie#reviews
    - returns all the reviews for a given movie
  - Review#movie
    - returns the movie for a given review

#### Hints:
  - The data always lives on the belongs_to relationship
  - Do the belongs_to first, then do the has_many
  - If there is a many to many, we need a third table
  - We've provided you with a `console.rb` file and a `seeds.rb` file. You can run `ruby tools/seeds.rb` to add some data to your database, and then `ruby tools/console.rb` to interact with your Ruby classes.


#### Write your domain model here:

#### movies
| id | title | release_year
#### genres
| id | name
#### movie_genres
| id | movie_id | genre_id
#### reviews
id | content | movie_id
