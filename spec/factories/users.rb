FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname { Faker::Name.initials }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    last_name { Faker::Japanese::Name.last_name }
    first_name { Faker::Japanese::Name.first_name }
    last_name_kana { person.last.katakana }
    first_name_kana { person.last.katakana }
    date_of_birth { Faker::Date.birthday }
  end
end
