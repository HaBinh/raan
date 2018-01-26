json.total @total
json.articles @articles.each do |article|
	  json.id article["id"]
	  json.code article["code"]
	  json.name article["name"]
	  json.imported_price article["imported_price"]
	  json.quantity article["quantity"]
	  json.sold article["sold"]
	  json.created_at article["time"].to_datetime.strftime("%d-%m-%Y %H:%M")
	end
