FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    quantity { 0 }
    category { "SAMPLE" }
  end
end
