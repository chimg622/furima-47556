FactoryBot.define do
  factory :purchase_address do
    post_number           { Faker::Base.bothify('###-####') }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    city                  { Faker::Address.city }
    address               { Faker::Address.street_address }
    building              { Faker::Address.secondary_address }
    phone_number          { Faker::Number.leading_zero_number(digits: 11) }
    token                 {"tok_abcdefghijk00000000000000000"}
    user_id               { 1 }
    item_id               { 1 }

  end
end
