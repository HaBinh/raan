FactoryGirl.define do
  factory :article do
    product 
    quantity { 10 }
    imported_price { 1500 }
  end
end