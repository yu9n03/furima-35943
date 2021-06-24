FactoryBot.define do
  factory :item do
    name            { Faker::Lorem.word }
    text            { Faker::Lorem.sentence }
    category_id     { Faker::Number.within(range: 2..11) }
    status_id       { Faker::Number.within(range: 2..3) }
    charge_rate_id  { Faker::Number.within(range: 2..7) }
    prefecture_id   { Faker::Number.within(range: 2..48) }
    until_send_id   { Faker::Number.within(range: 2..4) }
    price           { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
