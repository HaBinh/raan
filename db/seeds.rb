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

50.times do |n|
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

product=Product.create!(
    name: "iPhone X",
    code: "ASD-1234",
    category: "128GB-GOLD",
    default_imported_price: 999,
    default_sale_price: 1234
  )
5.times do |n|
  product.articles.create!(
    status: 'exist',
    imported_price: 1000)
end

product1=Product.create!(
      name: "iPhone 8",
      code: "LCD-5634",
      category: "64GB-GOLD",
      default_imported_price: 888,
      default_sale_price: 919
    )
6.times do |n|
  product1.articles.create!(
    status: 'exist',
    imported_price: 900)
end

product2=Product.create!(
      name: "OPPO F7",
      code: "OSE-4367",
      category: "18MP-SELFIE",
      default_imported_price: 345,
      default_sale_price: 456
    )
7.times do |n|
  product2.articles.create!(
    status: 'exist',
    imported_price: 345)
end

product3=Product.create!(
      name: "Samsung Galaxy Note 8",
      code: "NOT-9384",
      category: "64GB-GAME",
      default_imported_price: 899,
      default_sale_price: 999
    )
8.times do |n|
  product3.articles.create!(
    status: 'exist',
    imported_price: 901)
end

1.times do |n|
  product3.articles.create!(
    status: 'sold',
    imported_price: 901)
end

product4=Product.create!(
      name: "Laptop Apple Macbook Air",
      code: "MMG-2352",
      category: "128GB-2015",
      default_imported_price: 1100,
      default_sale_price: 1200
    )
9.times do |n|
  product4.articles.create!(
    status: 'exist',
    imported_price: 1100)
end

product5=Product.create!(
      name: "Laptop Apple Macbook Pro",
      code: "MPX-3182",
      category: "256GB-2017",
      default_imported_price: 2009,
      default_sale_price: 2100
    )
10.times do |n|
  product5.articles.create!(
    status: 'exist',
    imported_price: 2010)
end

2.times do |n|
  product5.articles.create!(
    status: 'sold',
    imported_price: 2010)
end

product6=Product.create!(
      name: "iPad Pro",
      code: "WIF-1056",
      category: "64GB-2017",
      default_imported_price: 678,
      default_sale_price: 699
    )
11.times do |n|
  product6.articles.create!(
    status: 'exist',
    imported_price: 680)
end

product7=Product.create!(
      name: "Sony Smartwatch 2",
      code: "SON-2201",
      category: "1.6Inch-Android",
      default_imported_price: 123,
      default_sale_price: 134
    )
12.times do |n|
  product7.articles.create!(
    status: 'exist',
    imported_price: 120)
end

3.times do |n|
  product7.articles.create!(
    status: 'sold',
    imported_price: 120)
end

product8=Product.create!(
      name: "USB 3.0",
      code: "IXP-3032",
      category: "32GB-USB 3.0",
      default_imported_price: 90,
      default_sale_price: 99
    )
14.times do |n|
  product8.articles.create!(
    status: 'exist',
    imported_price: 90)
end

product9=Product.create!(
      name: "Bluetooth AirPods Apple",
      code: "MME-2450",
      category: "3.5mm-Bluetooth",
      default_imported_price: 200,
      default_sale_price: 222
    )
15.times do |n|
  product9.articles.create!(
    status: 'exist',
    imported_price: 200)
end

4.times do |n|
  product9.articles.create!(
    status: 'sold',
    imported_price: 200)
end

rates = [0, 0.02, 0.05, 0.1, 0.2, 0.5]

rates.each do |rate|
  DiscountedRate.create!(
    rate: rate
  )
end
