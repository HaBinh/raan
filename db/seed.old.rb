This file should contain all the record creation needed to seed the database with its default values.
The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Examples:

  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  Character.create(name: 'Luke', movie: movies.first)
prng = Random.new
User.create(email: 'user@example.com', 
            nickname: 'UOne', 
            name: 'User One', 
            password: "monkey67",
            password_confirmation: "monkey67", 
            role: "manager")
User.create(email: 'admin@admin.com', 
            nickname: 'Admin', 
            name: 'Admin', 
            password: "admin123",
            password_confirmation: "admin123", 
            role: "manager")

5.times do |n|
  User.create(email: "staff#{n}@staff.com", 
            nickname: "Staff #{n}", 
            name: "Staff #{n}", 
            password: "staff123",
            password_confirmation: "staff123")
end
prng = Random.new
50.times do |n|
  name =  Faker::Name.name
  email = Faker::Internet.email
  phone = Faker::PhoneNumber.phone_number
  address = Faker::Address.city
  level = prng.rand(0..6)
  Customer.create!(
    name: name,
    email: email,
    phone: phone,
    address: address,
    level: level
    )
end
prng = Random.new
product=Product.create!(
  name: "iPhone X",
  code: "ASD-1234",
  unit: "Pieces",
  default_imported_price: 999,
  default_sale_price: 1234,
  created_at: '2016-11-03 09:29:13.77165'
)
user_id = prng.rand(1..7)
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
user_id = prng.rand(1..7)
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
user_id = prng.rand(1..7)
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
user_id = prng.rand(1..7)
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
user_id = prng.rand(1..7)
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
user_id = prng.rand(1..7)
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
user_id = prng.rand(1..7)
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
user_id = prng.rand(1..7)
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
user_id = prng.rand(1..7)
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
user_id = prng.rand(1..7)
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
user_id = prng.rand(1..7)
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


rates = [0, 0.02, 0.05, 0.1, 0.2,0.3, 0.5]

rates.each do |rate|
  DiscountedRate.create!(
    rate: rate
  )
end
product_rates = [0.01,0.02,0.03,0.05,0.08,0.1,0.12,0.15,0.18,0.2,0.22,0.25,0.3,0.4,0.5]
11.times do |n|
    discountRates = product_rates.sample(6)
    discountRates.push(0).sort!.each do |rate|
      ProductDiscountedRate.create!(
        rate: rate,
        product_id: Product.ids[n]
      )
    end
end
order 1
order1=Order.create!(
  id: 'C676F3',
  customer_id: '1',
  customer_paid: '2233',
  fully_paid: 'TRUE',
  created_at: '2016-11-03 09:29:13.77165',
  total_amount: '2233'
)
order_item11=order1.order_items.create!(
  order_id: order1.id,
  quantity: 1,
  amount: 999,
  created_at: '2016-11-03 09:29:13.77165',
  discounted_rate: 0
)
order_item12=order1.order_items.create!(
  order_id: order1.id,
  quantity: 1,
  amount: 1234,
  created_at: '2016-11-03 09:29:13.77165',
  discounted_rate: 0
)
user_id = prng.rand(1..7)
order_item11.articles.create!(
  status: 'sold',
  created_by: user_id,
  imported_price: 901,
  product_id: 4,
  created_at: '2016-11-03 09:29:13.77165',
  order_item_id: order_item11.id
)
order_item12.articles.create!(
  status: 'sold',
  imported_price: 1000,
  product_id: 1,
  created_by: user_id,
  created_at: '2016-11-03 09:29:13.77165',
  order_item_id: order_item12.id
)
# imported_price = [999,888,345,899,786,1100,2009,678,123,90,200]
pro = [2100,2000,750,1820,1620,2150,4050,1500,450,430,540]

12.times do |n|
    orderId = SecureRandom.hex(3).upcase
    5.times do |m|
      countPro = prng.rand(1..3)
      proPrice = pro.sample(countPro)
      time = Time.now - n.month
      customerId = prng.rand(1..10)
      total = 0
      arr_quantity=[]
      arr_rate=[]
      user_id = prng.rand(1..7)
      countPro.times do |t|
        quantity = prng.rand(1..3)
        rate = rates[prng.rand(0..4)]
        arr_quantity << quantity
        arr_rate << rate
        total += proPrice[t]*quantity*(1-rate)
      end
      total_amount=total
      a = prng.rand(0..2)
      if a === 1
        total *= 0.8
      else 
        if a === 2
          total *= 0.5
        end
      end
      if total === total_amount
        fully_paid = TRUE
      else
        fully_paid = FALSE
      end
      order = Order.create!(
        id: orderId,
        customer_id: customerId,
        created_at: time,
        total_amount: total_amount,
        customer_paid: total,
        fully_paid: fully_paid
      )
      countPro.times do |t|
        order_item = order.order_items.create!(
          order_id: order.id,
          quantity: arr_quantity[t],
          amount: proPrice[t]*(1-arr_rate[t])*arr_quantity[t],
          created_at: time,
          discounted_rate: arr_rate[t]
        )
        product_id = pro.index(proPrice[t]) + 1

        arr_quantity[t].times do |h|
          article = order_item.articles.create!(
              status: 'sold',
              created_by: user_id,
              imported_price:  proPrice[t]/2,
              product_id: product_id,
              created_at: time,
              order_item_id: order_item.id
            )
            # byebug
        end 
        
      end
    end
end