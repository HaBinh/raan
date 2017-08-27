FactoryGirl.define do
  factory :order_item do
    quantity { 5 } 
    article
  end
end