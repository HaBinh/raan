json.total @total
json.categories @categories.each do |category|
	json.id	category["id"]
	json.category category["category"]
end