# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "テストアイテム#{n}" }
    url { 'testproduct@supplebox.jp' }
    image_url { 'testproductimage@supplebox.jp' }
    sequence(:asin) { |n| "TESTPRODUCT#{n}" }
    association :brand
  end
end
