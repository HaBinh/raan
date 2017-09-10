FactoryGirl.define do
  factory :order_item do
    status { true } 
    article
  end
end