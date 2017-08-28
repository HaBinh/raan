json.extract! article, :id, :quantity, :price_sale

json.product do 
  product = Product.find_by_id(article.product_id)
  json.extract! product, :id, :name, :code, :categori, :price
end

