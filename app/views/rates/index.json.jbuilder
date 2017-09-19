json.discounted_rates @rates.each do |rate|
  json.extract! rate, :rate
end