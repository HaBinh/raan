json.stores @results.each do |store| 
    json.extract! store, :id, :name, :code, :default_sale_price, :quantity
end