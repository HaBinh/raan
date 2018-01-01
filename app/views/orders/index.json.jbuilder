json.orders @orders.each do |order|
  json.extract! order, :id, :total_amount, :customer_paid, :fully_paid, :debt, :created_at

  json.customer do 
    json.extract! order.customer, :id, :name, :email, :phone, :address
  end
end