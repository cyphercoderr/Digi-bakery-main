# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :batch_cookie, :class => 'BatchCookie' do
    association :storage, factory: :oven
    fillings { "MyString" }
  end
end
