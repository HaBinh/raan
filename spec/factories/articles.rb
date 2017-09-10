FactoryGirl.define do
  factory :article do
    product 
    status { true }
    imported_price { 1500 }
  end
end