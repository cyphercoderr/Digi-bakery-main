FactoryBot.define do
  factory :order do
    customer_name { Faker::Name.name }
    fulfilled { false }
    item do
      filling = ['peanut butter', 'chocolate', 'marshmallow', 'icing'].sample
      "Cookies with #{filling}"
    end
    quantity { Faker::Number.between(from: 2, to: 24) }
    pick_up_at { Faker::Number.between(from: 1, to: 10).days.from_now }
  end
end
