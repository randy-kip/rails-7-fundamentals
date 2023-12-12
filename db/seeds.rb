# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# delete all data first
puts 'Destroying existing records...'
WikiPost.destroy_all

WikiPost.create!(title: 'Repo')
WikiPost.create!(title: 'Dadadadan')
WikiPost.create!(title: 'Leaps')
WikiPost.create!(title: 'krrrraa')

puts 'Done!'