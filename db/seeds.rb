# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

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

photos = [
          "https://images.unsplash.com/photo-1464890100898-a385f744067f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZmxhdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"
          ]

60.times do
  # photo = URI.open(photos.sample)
  room = Room.create(price_per_night: rand(15..40), capacity: rand(1..5), photo: photos.sample)
  # room.photo.attach(io: photo, filename: "post.png", content_type: 'image/png')
  room.hotel = hotels.sample
  room.save
end

p "seed completed"
