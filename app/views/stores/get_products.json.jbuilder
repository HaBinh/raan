json.stores @stores.each do |store| 
    json.partial! 'products/product', product: store.product
    json.quantity store.quantity
end