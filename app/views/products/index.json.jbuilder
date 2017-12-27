json.total @total
json.products @products.each do |product| 
  json.extract! product.product, :id, :name, :code, :unit, :default_imported_price, :default_sale_price
  
  rates = product.rates 
  rate0 = [0] * (7 - rates.count) 
  rates = rate0 + rates 
  json.rates rates
end