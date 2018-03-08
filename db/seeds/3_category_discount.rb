category_discounts = [0.01,0.02,0.03,0.05,0.08,0.1,0.12,0.15,0.18,0.2,0.22,0.25,0.3,0.4,0.5]

5.times do |n|
    category_discount = category_discounts.sample(6).push(0)
    CategoryDiscount.create!(
        rate0: category_discount[0],
        rate1: category_discount[1],
        rate2: category_discount[2],
        rate3: category_discount[3],
        rate4: category_discount[4],
        rate5: category_discount[5],
        rate6: category_discount[6]
    )
end