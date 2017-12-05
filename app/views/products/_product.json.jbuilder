json.extract! product, :id, :name, :code, :unit, :default_imported_price, :default_sale_price, :active
rates = product.product_discounted_rates.map do |rate| 
    rate.rate
end
json.rates rates