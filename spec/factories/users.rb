FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'加藤'}
    first_name            {'由依'}
    last_name_kana        {'カトウ'}
    first_name_kana       {'ユイ'}
    birthday              {'1980-11-01'}
  end
end