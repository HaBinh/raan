article = Article.find_by_id(order_item.article_id)
product = Product.find_by_id(article.product_id)
json.extract! order_item, :id, :quantity
json.name product.name