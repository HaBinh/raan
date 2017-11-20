json.orders @orders.each do |order|
    json.extract! order, :id, :created_at
    customer = Customer.find_by_id(order.customer_id)
    json.extract! customer, :name, :email, :phone, :address
end