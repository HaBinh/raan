json.customer do 
  json.partial! "customers/customer", customer: @customer
end