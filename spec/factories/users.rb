FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '0000sa' }
    password_confirmation { password }
    last_name             { 'てすと' }
    first_name            { 'たろう' }
    last_kana             { 'テスト' }
    first_kana            { 'タロウ' }
    date                  { '2000-01-01' }
  end
end
