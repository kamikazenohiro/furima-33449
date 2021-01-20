FactoryBot.define do
  factory :order do
    postal_code    { '111-1111' }
    prefecture_id  { 1 }
    municipalities { 'test' }
    block_number   { 'test' }
    building_name  { 'test' }
    phone_number   { 1 }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
