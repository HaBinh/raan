json.total @total
json.categories @categories.each do |category|
	  json.category category["category"]
end