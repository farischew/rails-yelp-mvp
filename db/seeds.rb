require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Deleting old database...'
Restaurant.destroy_all

puts 'Creating seeds for restaurants...'

10.times do |index|
  puts "Creating Restaurant number #{index + 1}"
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    category: %w[chinese italian japanese french belgian].sample,
    phone_number: Faker::PhoneNumber.cell_phone
  )
  5.times do |review_index|
    puts "Printing Review #{review_index + 1}"
    review = Review.new(content: 'This is a test review', rating: 5)
    review.restaurant = restaurant
    review.save!
  end
end
