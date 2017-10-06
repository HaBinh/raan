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
  phone = Faker::PhoneNumber.phone_number
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
    default_sale_price: 1234,
    created_at: '2016-11-03 09:29:13.77165'
  )
5.times do |n|
  product.articles.create!(
    status: 'exist',
    imported_price: 1000,
    created_at: '2016-11-03 09:29:13.77165')
end

product1=Product.create!(
      name: "iPhone 8",
      code: "LCD-5634",
      category: "64GB-GOLD",
      default_imported_price: 888,
      default_sale_price: 919,
      created_at: '2016-12-03 09:29:13.77165'
    )
6.times do |n|
  product1.articles.create!(
    status: 'exist',
    imported_price: 900,
    created_at: '2016-12-03 09:29:13.77165')
end

product2=Product.create!(
      name: "OPPO F7",
      code: "OSE-4367",
      category: "18MP-SELFIE",
      default_imported_price: 345,
      default_sale_price: 456,
      created_at: '2017-01-03 09:29:13.77165'
    )
7.times do |n|
  product2.articles.create!(
    status: 'exist',
    imported_price: 345,
    created_at: '2017-01-03 09:29:13.77165')
end

product3=Product.create!(
      name: "Samsung Galaxy Note 8",
      code: "NOT-9384",
      category: "64GB-GAME",
      default_imported_price: 899,
      default_sale_price: 999,
      created_at: '2017-02-03 09:29:13.77165'
    )
8.times do |n|
  product3.articles.create!(
    status: 'exist',
    imported_price: 901,
    created_at: '2017-02-03 09:29:13.77165')
end

1.times do |n|
  product3.articles.create!(
    status: 'sold',
    imported_price: 901,
    created_at: '2017-02-03 09:29:13.77165')
end
product3=Product.create!(
  name: "Samsung Galaxy Note 7",
  code: "NOT-3242",
  category: "64GB-SELF",
  default_imported_price: 786,
  default_sale_price: 832,
  created_at: '2017-03-03 09:29:13.77165'
)
8.times do |n|
product3.articles.create!(
status: 'exist',
imported_price: 802,
created_at: '2017-03-03 09:29:13.77165')
end

1.times do |n|
product3.articles.create!(
status: 'sold',
imported_price: 802,
created_at: '2017-0-03 09:29:13.77165')
end

product4=Product.create!(
      name: "Laptop Apple Macbook Air",
      code: "MMG-2352",
      category: "128GB-2015",
      default_imported_price: 1100,
      default_sale_price: 1200,
      created_at: '2017-04-03 09:29:13.77165'
    )
9.times do |n|
  product4.articles.create!(
    status: 'exist',
    imported_price: 1100,
    created_at: '2017-04-03 09:29:13.77165')   
end

product5=Product.create!(
      name: "Laptop Apple Macbook Pro",
      code: "MPX-3182",
      category: "256GB-2017",
      default_imported_price: 2009,
      default_sale_price: 2100,
      created_at: '2017-05-03 09:29:13.77165'
    )
10.times do |n|
  product5.articles.create!(
    status: 'exist',
    imported_price: 2010,
    created_at: '2017-05-03 09:29:13.77165')
end

2.times do |n|
  product5.articles.create!(
    status: 'sold',
    imported_price: 2010,
    created_at: '2017-05-03 09:29:13.77165')
end

product6=Product.create!(
      name: "iPad Pro",
      code: "WIF-1056",
      category: "64GB-2017",
      default_imported_price: 678,
      default_sale_price: 699,
      created_at: '2017-06-03 09:29:13.77165'
    )
11.times do |n|
  product6.articles.create!(
    status: 'exist',
    imported_price: 680,
    created_at: '2017-06-03 09:29:13.77165')
end

product7=Product.create!(
      name: "Sony Smartwatch 2",
      code: "SON-2201",
      category: "1.6Inch-Android",
      default_imported_price: 123,
      default_sale_price: 134,
      created_at: '2017-07-03 09:29:13.77165'
    )
12.times do |n|
  product7.articles.create!(
    status: 'exist',
    imported_price: 120,
    created_at: '2017-07-03 09:29:13.77165')
end

3.times do |n|
  product7.articles.create!(
    status: 'sold',
    imported_price: 120,
    created_at: '2017-07-03 09:29:13.77165')
end

product8=Product.create!(
      name: "USB 3.0",
      code: "IXP-3032",
      category: "32GB-USB 3.0",
      default_imported_price: 90,
      default_sale_price: 99,
      created_at: '2017-08-03 09:29:13.77165'
    )
14.times do |n|
  product8.articles.create!(
    status: 'exist',
    imported_price: 90,
    created_at: '2017-08-03 09:29:13.77165')
end

product9=Product.create!(
      name: "Bluetooth AirPods Apple",
      code: "MME-2450",
      category: "3.5mm-Bluetooth",
      default_imported_price: 200,
      default_sale_price: 222,
      created_at: '2017-09-03 09:29:13.77165'
    )
15.times do |n|
  product9.articles.create!(
    status: 'exist',
    imported_price: 200,
    created_at: '2017-09-03 09:29:13.77165')
end

4.times do |n|
  product9.articles.create!(
    status: 'sold',
    imported_price: 200,
    created_at: '2017-09-03 09:29:13.77165')
end

rates = [0, 0.02, 0.05, 0.1, 0.2, 0.5]

rates.each do |rate|
  DiscountedRate.create!(
    rate: rate
  )
end
# order 1
order1=Order.create!(
  id: 'C676F3',
  customer_id: '1',
  customer_paid: '2233',
  fully_paid: 'TRUE',
  created_at: '2016-11-03 09:29:13.77165',
  total_amount: '2233'
)
order_item11=order1.order_items.create!(
  id: 1,
  order_id: order1.id,
  quantity: 1,
  amount: 999,
  created_at: '2016-11-03 09:29:13.77165',
  discounted_rate: 0
)
order_item12=order1.order_items.create!(
  id: 2,
  order_id: order1.id,
  quantity: 1,
  amount: 1234,
  created_at: '2016-11-03 09:29:13.77165',
  discounted_rate: 0
)
order_item11.articles.create!(
  status: 'sold',
  imported_price: 901,
  product_id: 4,
  created_at: '2016-11-03 09:29:13.77165',
  order_item_id: 1
)
order_item12.articles.create!(
  status: 'sold',
  imported_price: 1000,
  product_id: 1,
  created_at: '2016-11-03 09:29:13.77165',
  order_item_id: 2
)

# order 2
order2=Order.create!(
  id: '8AB368',
  customer_id: '2',
  customer_paid: '500',
  fully_paid: 'FALSE',
  created_at: '2016-12-03 09:29:13.77165',
  total_amount: 543
)
order_item21=order2.order_items.create!(
  id: 3,
  order_id: order1.id,
  quantity: 1,
  amount: 99,
  created_at: '2016-12-03 09:29:13.77165',
  discounted_rate: 0
)
order_item22=order2.order_items.create!(
  id: 4,
  order_id: order1.id,
  quantity: 2,
  amount: 444,
  created_at: '2016-12-03 09:29:13.77165',
  discounted_rate: 0
)
order_item21.articles.create!(
  status: 'sold',
  imported_price: 90,
  product_id: 10,
  created_at: '2016-12-03 09:29:13.77165',
  order_item_id: 3
)
2.times do |n|
  order_item22.articles.create!(
    status: 'sold',
    imported_price: 200,
    product_id: 11,
    created_at: '2016-12-03 09:29:13.77165',
    order_item_id: 4
  )
end
# order 3
order3=Order.create!(
  id: 'FE32D9',
  customer_id: '4',
  customer_paid: '300',
  fully_paid: 'FALSE',
  created_at: '2017-01-03 09:29:13.77165',
  total_amount: 327.1
)
order_item31=order3.order_items.create!(
  id: 5,
  order_id: order1.id,
  quantity: 1,
  amount:127.3,
  created_at: '2016-01-03 09:29:13.77165',
  discounted_rate: 0.05
)
order_item32=order3.order_items.create!(
  id: 6,
  order_id: order1.id,
  quantity: 1,
  amount: 199.8,
  created_at: '2017-01-03 09:29:13.77165',
  discounted_rate: 0.1
)
order_item31.articles.create!(
  status: 'sold',
  imported_price: 200,
  product_id: 11,
  created_at: '2017-01-03 09:29:13.77165',
  order_item_id: 6
)

order_item32.articles.create!(
    status: 'sold',
    imported_price: 120,
    product_id: 9,
    created_at: '2017-01-03 09:29:13.77165',
    order_item_id: 5
)