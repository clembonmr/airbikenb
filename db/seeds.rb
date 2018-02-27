# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




# CREATING USERS
# binding.pry
puts "///   Deleting all reviews"
Review.destroy_all
puts "///   Deleting all bookings"
Booking.destroy_all
puts "///   Deleting all bikes"
Bike.destroy_all


puts "///   Creating users"
16.times do
  user = User.new(
    email: Faker::Internet.free_email,
    password: Faker::Internet.password(8),
    phone_number: Faker::PhoneNumber.phone_number,
    name: Faker::Name.first_name,
    remote_photo_url: "https://kitt.lewagon.com/placeholder/users/random")
  if user.save
    puts user.name + " created!"
  end
end

puts "///   #{User.count} users in the database!"





# CREATING BIKES

puts "///   Creating bikes"

brand = ["Cervélo", "American", "Avanti", "Bianchi", "Cannondale", "Canyon", "Diamondback", "Giant", "K2 Sports", "Lapierre", "Mongoose", "Scott", "Specialized"]

category = %w(road moutain city beach enduro hybrid triathlon)

address = ["milano, italy", "roma, italy", "firenze, italy", "venize, italy", "naples, italy", "bari, italy", "tarronto, italy", "lecce, italy", "pompeii, italy", "latina, italy", "ancona, italy", "vasto, italy", "andria, italy", "piza, italy", "genoa, italy", "bologna, italy", "verona, italy", "turin, italy", "asti, italy", "paris", "berlin", "lisbon", "oslo", "london"]

i = 0
21.times do
  i += 1
  bike = Bike.new(
    user_id: User.all.sample.id,
    brand: brand.sample,
    category: category.sample,
    description: Faker::Lorem.sentence(200, true, 40),
    daily_price: rand(5..20)*10,
    location: address.sample,
    remote_photo_url: "http://res.cloudinary.com/dxkimzdwk/image/upload/v1519361768/b#{i}.jpg")

  if bike.save
    puts bike.brand + " created!"
  end
end

puts "///   #{Bike.count} bikes created!"

# CREATING BOOKINGS

puts "///   Creating bookings"

Bike.all.each do |bike|
  x = rand (1..20)
  delay = 1
  x.times do
    booking = Booking.new
    booking.bike_id = bike.id
    booking.user_id = User.all.sample.id
    booking.start_date = Date.today + (8 * delay).days
    booking.end_date = booking.start_date + 7.days
    delay += 1
    if booking.save
      puts "1 booking just created for #{bike.brand}"
    else
      puts "!!! booking not save"
    end
  end
end
puts "///  #{Booking.count} booking created!"


# CREATING REVIEWS
puts "///   Creating reviews"

Booking.all.each do |booking|
  review = Review.new
  review.rate = rand(1..5)
  review.booking_id = booking.id
  review.description = Faker::Lorem.sentence(60, true, 20)
  review.save
  puts "1 review created for booking #{booking.id}"
end
puts "///   #{Review.count} reviews created!"



