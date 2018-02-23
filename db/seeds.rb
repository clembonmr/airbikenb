# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


brand = ["Cervélo", "American Eagle", "Avanti", "Bianchi", "Cannondale", "Canyon bicycles", "Diamondback Bicycles", "Giant", "K2 Sports", "Lapierre", "Mongoose", "Scott", "Specialized"]

category = %w(road moutain city beach enduro hybrid triathlon)


puts "Deleting all bikes"
Bike.destroy_all
puts "Creating 10 bikes"
100.times do
  bikes = Bike.new(
    brand: brand.sample,
    category: category.sample,
    description: Faker::Lorem.sentence(40, true, 10)
    daily_price: rand(5..20)*10
    location: Faker::Address.street_address)
  if bikes.save
    puts bikes.name + " created!"
  end
end

puts "#{Bike.count} bikes created!"
