json.orders @orders.each do |order|
  json.extract! order, :id, :total_amount, :customer_paid, :fully_paid, :debt, :created_at

  json.customer do 
    json.id order.customer_id
    json.extract! order, :name, :email, :phone, :address
  end
end