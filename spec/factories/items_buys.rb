FactoryBot.define do
  factory :order do
    user_id        { 1 }
    item_id        { 1 }
    token          { 'tok_abcdefghijk00000000000000000' }
    postal_code    { '111-1111' }
    prefecture_id  { 1 }
    municipalities { 'test' }
    block_number   { 'test' }
    building_name  { 'test' }
    phone_number   { '09012345678' }
  end
end
