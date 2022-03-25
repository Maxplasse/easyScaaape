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
          "https://images.unsplash.com/photo-1464890100898-a385f744067f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZmxhdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
          "https://images.unsplash.com/photo-1622866306950-81d17097d458?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8ZmxhdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
          "https://images.unsplash.com/photo-1529408632839-a54952c491e5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZmxhdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
          "https://images.unsplash.com/photo-1557040343-826391a0acad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGZsYXR8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
          "https://images.unsplash.com/photo-1451153378752-16ef2b36ad05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmxhdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
          "https://media.istockphoto.com/photos/black-and-white-kitchen-picture-id1217418175?k=20&m=1217418175&s=612x612&w=0&h=KN6Wt0_UR3-5zVPDfyISr2EmEFuDQ6HPbjAKkvoXb4E=",
          "https://images.pexels.com/photos/2459/stairs-home-loft-lifestyle.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          "https://images.pexels.com/photos/584399/living-room-couch-interior-room-584399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          "https://images.pexels.com/photos/6492402/pexels-photo-6492402.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          "https://images.pexels.com/photos/6301168/pexels-photo-6301168.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          "https://images.pexels.com/photos/6585598/pexels-photo-6585598.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          "https://images.pexels.com/photos/6508358/pexels-photo-6508358.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          "https://images.pexels.com/photos/5824519/pexels-photo-5824519.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          "https://images.pexels.com/photos/5998120/pexels-photo-5998120.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          "https://images.pexels.com/photos/6782567/pexels-photo-6782567.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          "https://images.pexels.com/photos/6032416/pexels-photo-6032416.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          "https://images.pexels.com/photos/3952034/pexels-photo-3952034.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          "https://images.pexels.com/photos/7018389/pexels-photo-7018389.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
          ]

60.times do
  # photo = URI.open(photos.sample)
  room = Room.create(price_per_night: rand(15..40), capacity: rand(1..5), photo: photos.sample)
  # room.photo.attach(io: photo, filename: "post.png", content_type: 'image/png')
  room.hotel = hotels.sample
  room.save
end

p "seed completed"
