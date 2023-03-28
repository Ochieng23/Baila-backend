# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# category_id corresponds to a foreign key that references a separate categories table
Album.create(name: "Thriller", release_date: "1982-11-30", category_id: 1)
Album.create(name: "The Dark Side of the Moon", release_date: "1973-03-01", category_id: 2)
Album.create(name: "Rumours", release_date: "1977-02-04", category_id: 3)
Album.create(name: "Purple Rain", release_date: "1984-06-25", category_id: 1)
Album.create(name: "Abbey Road", release_date: "1969-09-26", category_id: 2)
