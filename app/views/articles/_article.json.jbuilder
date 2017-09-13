json.extract! article, :id, :status, :imported_price
json.created_at article.created_at.strftime("%A, %d/%m/%Y")
product = Product.find_by_id(article.product_id)
json.product_id product.id
json.exist article.product.category
json.extract! product, :name, :code, :category, :default_imported_price, :default_sale_price