FactoryBot.define do
  factory :product do
    title { 'テストアイテム' }
    url { 'URL' }
    image_url { 'IMAGE_URL' }
    asin { 'TEST' }
    price { '1000' }
    brand_amazon_name { 'テストブランド' }
    user
    prouct
  end
end