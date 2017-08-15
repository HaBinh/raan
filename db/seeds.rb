# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'user@example.com', 
            nickname: 'UOne', 
            name: 'User One', 
            password: "monkey67",
            password_confirmation: "monkey67")

5.times do |n|
  name =  Faker::Name.name
  email = Faker::Internet.email
  phone = "01237546997"
  address = Faker::Address.city
  Customer.create!(
    name: name,
    email: email,
    phone: phone,
    address: address
    )
end

5.times do |n|
  name =  Faker::Name.name
  code = Faker::Code.imei 
  price = "1000$"
  categori = Faker::Color.color_name
  Product.create!(
    name: name,
    code: code,
    categori: categori,
    price_sale: price
    )
end	