FactoryBot.define do
  factory :shopping_order do
    post_number { '123-4567' }
    current_place_id { Faker::Number.between(from: 2, to: 48) }
    city { 'ああああ' }
    street_number { 'あああ123' }
    phone_number { Faker::Number.number(digits: 10) }
    token { 'test0000' }
  end
end
