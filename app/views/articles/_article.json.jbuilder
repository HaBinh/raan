json.extract! article, :id, :quantity, :imported_price

json.product do 
  product = Product.find_by_id(article.product_id)
  json.extract! product, :id, :name, :code, :category, :default_imported_price, :default_sale_price
end

