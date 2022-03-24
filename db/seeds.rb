# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

p "Destroying hotels"
Hotel.destroy_all
p "Destroying room"
Room.destroy_all
p "Destroying user"
User.destroy_all
p "Destroying bookings"
Booking.destroy_all

hotels = []

User.create(email: "m20plasse@gmail.com", password: "plasse")

15.times do
  hotel = Hotel.create(name: Faker::Movie.title, address: Faker::Address.street_name)
  hotels << hotel
end


60.times do
  room = Room.create(price_per_night: rand(15..40), capacity: rand(1..5))
  room.hotel = hotels.sample
  room.save
end

p "seed completed"
