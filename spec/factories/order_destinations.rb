FactoryBot.define do
  factory :order_destination do
    postal_code     { '123-4567'}
    prefecture_id   { Faker::Number.within(range: 2..48) }
    municipality    { '東京都' }
    address         { '１−１' }
    building_name   { '東京ハイツ' }
    phone_number    {Faker::Number.number(digits: 10)}
    token           {"tok_abcdefghijk00000000000000000"}
  end
end
