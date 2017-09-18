json.extract! store, :id, :status, :imported_price
json.updated_at store.created_at.strftime("%A, %d/%m/%Y")
product = Product.find_by_id(store.product_id)
json.product_id product.id
json.extract! product, :name, :code, :category, :default_imported_price, :default_sale_price