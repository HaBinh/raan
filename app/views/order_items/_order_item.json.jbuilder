product = Product.find_by_id(order_item.product_id)
json.extract! order_item, :id, :amount, :quantity, :discounted_rate
json.product do 
  json.partial! "products/product", product: product
end