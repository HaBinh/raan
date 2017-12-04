json.extract! product, :id, :name, :code, :unit, :default_imported_price, :default_sale_price, :active
json.rates product.product_discounted_rates.each do |rate| 
    json.rate rate.rate
end