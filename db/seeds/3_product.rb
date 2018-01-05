@prng = Random.new
# rates = [0, 0.02, 0.05, 0.1, 0.2,0.3, 0.5]
@product=Product.create!(
  name: "iPhone X",
  code: "ASD-1234",
  unit: "Pieces",
  default_imported_price: 999,
  default_sale_price: 1234,
  created_at: '2016-11-03 09:29:13.77165'
)

@product1=Product.create!(
    name: "iPhone 8",
    code: "LCD-5634",
    unit: "Pieces",
    default_imported_price: 888,
    default_sale_price: 919,
    created_at: '2016-12-03 09:29:13.77165'
  )

@product2=Product.create!(
    name: "OPPO F7",
    code: "OSE-4367",
    unit: "Pieces",
    default_imported_price: 200,
    default_sale_price: 456,
    created_at: '2017-01-03 09:29:13.77165'
  )

@product3=Product.create!(
    name: "Samsung Galaxy Note 8",
    code: "NOT-9384",
    unit: "Pieces",
    default_imported_price: 899,
    default_sale_price: 999,
    created_at: '2017-02-03 09:29:13.77165'
  )

@product4=Product.create!(
    name: "Samsung Galaxy Note 7",
    code: "NOT-3242",
    unit: "Pieces",
    default_imported_price: 786,
    default_sale_price: 832,
    created_at: '2017-03-03 09:29:13.77165'
    )

@product5=Product.create!(
    name: "Laptop Apple Macbook Air",
    code: "MMG-2352",
    unit: "Pieces",
    default_imported_price: 1100,
    default_sale_price: 1200,
    created_at: '2017-04-03 09:29:13.77165'
  )

@product6=Product.create!(
    name: "Laptop Apple Macbook Pro",
    code: "MPX-3182",
    unit: "Pieces",
    default_imported_price: 2009,
    default_sale_price: 2100,
    created_at: '2017-05-03 09:29:13.77165'
  )

@product7=Product.create!(
    name: "iPad Pro",
    code: "WIF-1056",
    unit: "Pieces",
    default_imported_price: 678,
    default_sale_price: 699,
    created_at: '2017-06-03 09:29:13.77165'
  )

@product8=Product.create!(
    name: "Sony Smartwatch 2",
    code: "SON-2201",
    unit: "Pieces",
    default_imported_price: 123,
    default_sale_price: 134,
    created_at: '2017-07-03 09:29:13.77165'
  )

@product9=Product.create!(
    name: "USB 3.0",
    code: "IXP-3032",
    unit: "Pieces",
    default_imported_price: 90,
    default_sale_price: 99,
    created_at: '2017-08-03 09:29:13.77165'
  )
@product10=Product.create!(
    name: "Bluetooth AirPods Apple",
    code: "MME-2450",
    unit: "Pieces",
    default_imported_price: 200,
    default_sale_price: 222,
    created_at: '2017-09-03 09:29:13.77165'
  )

2000.times do |n| 
  Product.create!(
    name: "Product #{n}",
    code: "#{n}",
    unit: "Cai",
    default_imported_price: n+1,
    default_sale_price: n+100,
  )
end
# //discounted rate for product
product_rates = [0.01,0.02,0.03,0.05,0.08,0.1,0.12,0.15,0.18,0.2,0.22,0.25,0.3,0.4,0.5]
Product.all.each do |product| 
    discountRates = product_rates.sample(6)
    discountRates.push(0).sort!.each do |rate|
      ProductDiscountedRate.create!(
        rate: rate,
        product_id: product.id
      )
    end
end