# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




# CREATING USERS

puts "Deleting all bikes"
Bike.destroy_all


puts "Creating users"
12.times do
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

puts "#{User.count} users created!"





# CREATING BIKES

puts "Creating bikes"

brand = ["Cervélo", "American Eagle", "Avanti", "Bianchi", "Cannondale", "Canyon bicycles", "Diamondback Bicycles", "Giant", "K2 Sports", "Lapierre", "Mongoose", "Scott", "Specialized"]

category = %w(road moutain city beach enduro hybrid triathlon)

10.times do
  bike = Bike.new(
    user_id: User.all.sample.id,
    brand: brand.sample,
    category: category.sample,
    description: Faker::Lorem.sentence(40, true, 10),
    daily_price: rand(5..20)*10,
    location: Faker::Address.street_address,
    remote_photo_url: "http://res.cloudinary.com/dxkimzdwk/image/upload/v1519361768/b#{rand(1..10)}.jpg")
  if bike.save
    puts bike.brand + " created!"
  end
end

puts "#{Bike.count} bikes created!"
