FactoryBot.define do
  factory :item do
    name {'サンプル'}
    explain {'サンプルの説明'}
    price {Faker::Number.between(from: 300, to: 9999999)}
    category_id {Faker::Number.between(from: 2, to: 11)}
    condition_id {Faker::Number.between(from: 2, to: 7)}
    shopping_change_id {Faker::Number.between(from: 2, to: 3)}
    current_place_id {Faker::Number.between(from: 2, to: 48)}
    send_day_id {Faker::Number.between(from: 2, to: 4)}
    association :user
  end
end