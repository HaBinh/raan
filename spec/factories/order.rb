FactoryGirl.define do
  factory :order do
    customer  
    total_amount { 4000 }
  end
end