json.total @total
json.category_discounts @category_discounts.each do |category_discount|
	json.id	category_discount["id"]
    json.category category_discount["category"]
    json.rate0 category_discount["rate0"]
    json.rate1 category_discount["rate1"]
    json.rate2 category_discount["rate2"]
    json.rate3 category_discount["rate3"]
    json.rate4 category_discount["rate4"]
    json.rate5 category_discount["rate5"]
    json.rate6 category_discount["rate6"]
end