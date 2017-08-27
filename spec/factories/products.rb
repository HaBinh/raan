FactoryGirl.define do
  factory :product do
    name { Faker::Name.name }
    code { Faker::Code.imei  }
    categori { Faker::Color.color_name}
    price_sale { "1000" }
  end
end