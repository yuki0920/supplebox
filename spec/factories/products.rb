# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    title { 'テストアイテム' }
    url { 'testproduct@supplebox.jp' }
    image_url { 'testproductimage@supplebox.jp' }
    sequence(:asin) { |n| "TESTPRODUCT#{n}" }
    association :brand
  end
end
