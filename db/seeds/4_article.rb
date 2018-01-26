Product.all.each do |product|
  user_id = @prng.rand(1..10)
  exist = @prng.rand(1..10)
  sold = @prng.rand(0..5)
  
  exist.times do |n|
    product.articles.create!(
    status: 'exist',
    created_by: user_id,
    product_id: product.id,
    imported_price: 200)
  end
  sold.times do |n|
    product.articles.create!(
    status: 'sold',
    created_by: user_id,
    product_id: product.id,
    imported_price: 200)
  end
end