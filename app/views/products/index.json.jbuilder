json.total @total
json.products @products.each do |product| 
  json.extract! product.product, :id, :name, :code, :unit, :default_imported_price, :default_sale_price
  if Product.where(id: product.product.id).first.category_id != nil
    json.category Product.where(id: product.product.id).first.category.category
  else
    json.category ""
  end
  rates = product.rates 
  rate0 = [0] * (7 - rates.count) 
  rates = rate0 + rates 
  json.rates rates
end