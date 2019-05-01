FactoryBot.define do
  factory :post do
    title { 'テストタイトル' }
    rate { '3' }
    content { 'テストコンテント' }
    association :user
    association :product
  end
end