5.times do |n|
    Category.create!(
        category: "A",
        category_discount_id: CategoryDiscount.ids[n]
    )
end