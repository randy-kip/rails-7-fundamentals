# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# seeds.rb

# Destroy all existing records in the WikiPost model
puts 'Destroying existing WikiPost records...'
WikiPost.destroy_all

# Create new WikiPost records with title, description, and author attributes
puts 'Seeding WikiPost records...'

WikiPost.create!(
  title: 'Repo',
  description: 'A repository for storing and managing code.',
  author: 'John Doe'
)

WikiPost.create!(
  title: 'Dadadadan',
  description: 'A fun and catchy phrase with no specific meaning.',
  author: 'Jane Smith'
)

WikiPost.create!(
  title: 'Leaps',
  description: 'Exploring new ideas and making significant progress.',
  author: 'Alex Johnson'
)

WikiPost.create!(
  title: 'krrrraa',
  description: 'A sound effect often associated with fast movement.',
  author: 'Chris Williams'
)

puts 'Seeding completed.'
