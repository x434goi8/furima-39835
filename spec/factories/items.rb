FactoryBot.define do
  factory :item do
    product_name                     {'名前'}
    product_description              {'説明'}
    price                            {'2000'}
    condition_id                     {'2'}
    shipping_fee_responsibility_id   {'2'}
    prefecture_id                    {'2'}
    shipping_duration_id             {'2'}
    category_id                      {'2'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
