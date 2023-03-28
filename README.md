## Music Streaming Service Backend

This repository contains the backend code for a music streaming service built with Ruby on Rails, MySQL, and deployed on Railways. The application includes an artist table, where each artist is assigned a category. Each category has many albums, and each album has many songs.

# Getting Started
Prerequisites

Ruby 2.7.4

Rails 6.1.4

MySQL 5.7

# Installation
Clone the repository to your local machine.

Install dependencies with bundle install

Create the database with rails db:create

Migrate the database with rails db:migrate

Start the server with rails s

# Database Schema
The database schema for this project consists of five tables:

artists: Contains information about each artist, including their name, bio, and the category they belong to. Artists can create profiles and login. 

categories: Contains information about each music category, including its name and a short description.

albums: Contains information about each album, including its name, release date, and the category it belongs to.

songs: Contains information about each song, including its name, length, and the album it belongs to.

users: contains information about users accessing the platform. users can create profiles and login. 
Users have access to all the other table using macro associtations. 
## Usage
The API endpoints can be tested using a tool like Postman.

### API Endpoints

Artists

GET /artists - Get a list of all artists

GET /artists/:id - Get a specific artist by ID

POST /artists - Create a new artist

PUT /artists/:id - Update an artist by ID

DELETE /artists/:id - Delete an artist by ID

Categories

GET /categories - Get a list of all categories

GET /categories/:id - Get a specific category by ID

POST /categories - Create a new category

PUT /categories/:id - Update a category by ID

DELETE /categories/:id - Delete a category by ID

Albums

GET /albums - Get a list of all albums

GET /albums/:id - Get a specific album by ID

POST /albums - Create a new album

PUT /albums/:id - Update an album by ID

DELETE /albums/:id - Delete an album by ID

Songs

GET /songs - Get a list of all songs

GET /songs/:id - Get a specific song by ID

POST /songs - Create a new song

PUT /songs/:id - Update a song by ID

DELETE /songs/:id - Delete a song by ID

## Licence 

Project licnced under Moringa School licence 

## Author 
Paul Omondi 