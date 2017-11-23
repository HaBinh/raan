user_id = @prng.rand(1..7)
5.times do |n|
@product.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 1000,
  created_at: '2016-11-03 09:29:13.77165')
end

user_id = @prng.rand(1..7)
6.times do |n|
@product1.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 900,
  created_at: '2016-12-03 09:29:13.77165')
end

user_id = @prng.rand(1..7)
7.times do |n|
@product2.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 345,
  created_at: '2017-01-03 09:29:13.77165')
end

user_id = @prng.rand(1..7)
8.times do |n|
@product3.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 901,
  created_at: '2017-02-03 09:29:13.77165')
end

1.times do |n|
@product3.articles.create!(
  status: 'sold',
  created_by: user_id,
  imported_price: 901,
  created_at: '2017-02-03 09:29:13.77165')
end

user_id = @prng.rand(1..7)
8.times do |n|
@product3.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 802,
  created_at: '2017-03-03 09:29:13.77165')
end

1.times do |n|
@product4.articles.create!(
  status: 'sold',
  created_by: user_id,
  imported_price: 802,
  created_at: '2017-0-03 09:29:13.77165')
end

user_id = @prng.rand(1..7)
9.times do |n|
@product4.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 1100,
  created_at: '2017-04-03 09:29:13.77165')   
end

user_id = @prng.rand(1..7)
10.times do |n|
@product5.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 2010,
  created_at: '2017-05-03 09:29:13.77165')
end

2.times do |n|
@product5.articles.create!(
  status: 'sold',
  created_by: user_id,
  imported_price: 2010,
  created_at: '2017-05-03 09:29:13.77165')
end

user_id = @prng.rand(1..7)
11.times do |n|
@product6.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 680,
  created_at: '2017-06-03 09:29:13.77165')
end

user_id = @prng.rand(1..7)
12.times do |n|
@product7.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 120,
  created_at: '2017-07-03 09:29:13.77165')
end

3.times do |n|
@product7.articles.create!(
  status: 'sold',
  created_by: user_id,
  imported_price: 120,
  created_at: '2017-07-03 09:29:13.77165')
end

user_id = @prng.rand(1..7)
14.times do |n|
@product8.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 90,
  created_at: '2017-08-03 09:29:13.77165')
end

user_id = @prng.rand(1..7)
15.times do |n|
@product9.articles.create!(
  status: 'exist',
  created_by: user_id,
  imported_price: 200,
  created_at: '2017-09-03 09:29:13.77165')
end

4.times do |n|
@product9.articles.create!(
  status: 'sold',
  created_by: user_id,
  imported_price: 200,
  created_at: '2017-09-03 09:29:13.77165')
end