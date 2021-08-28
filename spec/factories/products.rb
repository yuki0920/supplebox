# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "テストアイテム#{n}" }
    url { 'testproduct@supplebox.tokyo' }
    # NOTE: amazonの画像のURL
    image_url { 'http://example.com' }
    sequence(:asin) { |n| "TESTPRODUCT#{n}" }
    price { 100 }
    brand_amazon_name { 'テストブランド' }
  end
end
