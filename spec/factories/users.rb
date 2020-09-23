FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"北"}
    first_name            {"原"}
    family_name_kana      {"キタ"}
    first_name_kana       {"ハラ"}
    birthday              {Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
  end
end