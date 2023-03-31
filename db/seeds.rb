# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



Album.create(name: "Thriller", release_date: "1982-11-30", category_id: 1)
Album.create(name: "The Dark Side of the Moon", release_date: "1973-03-01", category_id: 2)
Album.create(name: "Rumours", release_date: "1977-02-04", category_id: 3)
Album.create(name: "Purple Rain", release_date: "1984-06-25", category_id: 1)
Album.create(name: "Abbey Road", release_date: "1969-09-26", category_id: 2)



Category.create(
  name: "Rock",
  description: "A genre of popular music that originated in the 1950s and 1960s."
)

Category.create(
  name: "Pop",
  description: "A genre of popular music that originated in the mid-1950s."
)

Category.create(
  name: "Hip Hop",
  description: "A genre of popular music that originated in African American communities in the United States during the 1970s."
)

Category.create(
  name: "Electronic",
  description: "A genre of music that is produced using electronic devices and technology."
)

Category.create(
  name: "Classical",
  description: "A genre of music that is rooted in Western tradition and is typically composed using formal structures."
)


Artist.create(
  name: "Bien Aime",
  bio: "John Doe is a talented musician with over 10 years of experience.",
  category_id: 1,
  email: "johndoe@example.com",
  password: "password123"
)

Artist.create(
  name: "jay melody",
  bio: "Omah Lay is a talented musician with over 10 years of experience.",
  category_id: 4,
  email: "omahlay@example.com",
  password: "password123"
)

Artist.create(
  name: "diamond",
  bio: "Ayra star is a talented musician with over 10 years of experience.",
  category_id: 5,
  email: "ayrastar@example.com",
  password: "password123"
)