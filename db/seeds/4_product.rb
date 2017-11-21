@prng = Random.new
rates = [0, 0.02, 0.05, 0.1, 0.2,0.3, 0.5]
product=Product.create!(
  name: "iPhone X",
  code: "ASD-1234",
  unit: "Pieces",
  default_imported_price: 999,
  default_sale_price: 1234,
  created_at: '2016-11-03 09:29:13.77165'
)
user_id = @prng.rand(1..7)
5.times do |n|
product.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 1000,
  created_at: '2016-11-03 09:29:13.77165')
end

product1=Product.create!(
    name: "iPhone 8",
    code: "LCD-5634",
    unit: "Pieces",
    default_imported_price: 888,
    default_sale_price: 919,
    created_at: '2016-12-03 09:29:13.77165'
  )
user_id = @prng.rand(1..7)
6.times do |n|
product1.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 900,
  created_at: '2016-12-03 09:29:13.77165')
end

product2=Product.create!(
    name: "OPPO F7",
    code: "OSE-4367",
    unit: "Pieces",
    default_imported_price: 345,
    default_sale_price: 456,
    created_at: '2017-01-03 09:29:13.77165'
  )
user_id = @prng.rand(1..7)
7.times do |n|
product2.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 345,
  created_at: '2017-01-03 09:29:13.77165')
end

product3=Product.create!(
    name: "Samsung Galaxy Note 8",
    code: "NOT-9384",
    unit: "Pieces",
    default_imported_price: 899,
    default_sale_price: 999,
    created_at: '2017-02-03 09:29:13.77165'
  )
user_id = @prng.rand(1..7)
8.times do |n|
product3.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 901,
  created_at: '2017-02-03 09:29:13.77165')
end

1.times do |n|
product3.articles.create!(
  status: 'sold',
  created_by: user_id,
  imported_price: 901,
  created_at: '2017-02-03 09:29:13.77165')
end
product3=Product.create!(
name: "Samsung Galaxy Note 7",
code: "NOT-3242",
unit: "Pieces",
default_imported_price: 786,
default_sale_price: 832,
created_at: '2017-03-03 09:29:13.77165'
)
user_id = @prng.rand(1..7)
8.times do |n|
product3.articles.create!(
status: 'exist',
created_by: user_id,
imported_price: 802,
created_at: '2017-03-03 09:29:13.77165')
end

1.times do |n|
product3.articles.create!(
status: 'sold',
created_by: user_id,
imported_price: 802,
created_at: '2017-0-03 09:29:13.77165')
end

product4=Product.create!(
    name: "Laptop Apple Macbook Air",
    code: "MMG-2352",
    unit: "Pieces",
    default_imported_price: 1100,
    default_sale_price: 1200,
    created_at: '2017-04-03 09:29:13.77165'
  )
user_id = @prng.rand(1..7)
9.times do |n|
product4.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 1100,
  created_at: '2017-04-03 09:29:13.77165')   
end

product5=Product.create!(
    name: "Laptop Apple Macbook Pro",
    code: "MPX-3182",
    unit: "Pieces",
    default_imported_price: 2009,
    default_sale_price: 2100,
    created_at: '2017-05-03 09:29:13.77165'
  )
user_id = @prng.rand(1..7)
10.times do |n|
product5.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 2010,
  created_at: '2017-05-03 09:29:13.77165')
end

2.times do |n|
product5.articles.create!(
  status: 'sold',
  created_by: user_id,
  imported_price: 2010,
  created_at: '2017-05-03 09:29:13.77165')
end

product6=Product.create!(
    name: "iPad Pro",
    code: "WIF-1056",
    unit: "Pieces",
    default_imported_price: 678,
    default_sale_price: 699,
    created_at: '2017-06-03 09:29:13.77165'
  )
user_id = @prng.rand(1..7)
11.times do |n|
product6.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 680,
  created_at: '2017-06-03 09:29:13.77165')
end

product7=Product.create!(
    name: "Sony Smartwatch 2",
    code: "SON-2201",
    unit: "Pieces",
    default_imported_price: 123,
    default_sale_price: 134,
    created_at: '2017-07-03 09:29:13.77165'
  )
user_id = @prng.rand(1..7)
12.times do |n|
product7.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 120,
  created_at: '2017-07-03 09:29:13.77165')
end

3.times do |n|
product7.articles.create!(
  status: 'sold',
  created_by: user_id,
  imported_price: 120,
  created_at: '2017-07-03 09:29:13.77165')
end

product8=Product.create!(
    name: "USB 3.0",
    code: "IXP-3032",
    unit: "Pieces",
    default_imported_price: 90,
    default_sale_price: 99,
    created_at: '2017-08-03 09:29:13.77165'
  )
user_id = @prng.rand(1..7)
14.times do |n|
product8.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 90,
  created_at: '2017-08-03 09:29:13.77165')
end

product9=Product.create!(
    name: "Bluetooth AirPods Apple",
    code: "MME-2450",
    unit: "Pieces",
    default_imported_price: 200,
    default_sale_price: 222,
    created_at: '2017-09-03 09:29:13.77165'
  )
user_id = @prng.rand(1..7)
15.times do |n|
product9.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 200,
  created_at: '2017-09-03 09:29:13.77165')
end

4.times do |n|
product9.articles.create!(
  status: 'sold',
  created_by: user_id,
  imported_price: 200,
  created_at: '2017-09-03 09:29:13.77165')
end
