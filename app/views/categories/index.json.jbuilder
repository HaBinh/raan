json.total @total
json.categories @categories.each do |category|
	json.extract! category, :id, :category, :rates
end