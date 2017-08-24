json.customer do 
  customer = Customer.find_by_id(order.customer_id)
  byebug
  json.partial "customers/customer", customer: customer
end

json.order_items do 
  json.array! @order_items, partial: 'order_items/order_item', as: :order_item
end
