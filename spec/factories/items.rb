FactoryBot.define do
  factory :item do
    name                   { Faker::Name.initials(number: 10) }
    item_details           { Faker::Lorem.characters(number: 100) }
    category_id            { Faker::Number.between(from: 2, to: 11) }
    state_id               { Faker::Number.between(from: 2, to: 7) }
    price                  { Faker::Number.between(from: 300, to: 9_999_999) }
    postage_id             { Faker::Number.between(from: 2, to: 3) }
    prefecture_id          { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id       { Faker::Number.between(from: 2, to: 4) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
