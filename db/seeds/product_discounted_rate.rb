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