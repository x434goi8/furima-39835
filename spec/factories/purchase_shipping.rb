FactoryBot.define do
  factory :purchase_shipping do
    postal_code { Faker::Number.between(from: 100, to: 999).to_s + '-' + Faker::Number.between(from: 1000, to: 9999).to_s }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city_or_district { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    phone_number { '0' + Faker::Number.between(from: 100_000_000, to: 9_999_999_999).to_s }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
