sql = 
"update order_items 
set product_id = ( select articles.product_id 
    from articles 
    where articles.order_item_id = order_items.id
    limit 1 
)"
ActiveRecord::Base.connection.execute(sql)