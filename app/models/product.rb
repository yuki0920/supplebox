# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy, inverse_of: :product
  has_many :users, through: :likes

  validates :title, presence: true, length: {maximum: 255}
  validates :url, presence: true
  validates :image_url, presence: true, length: {maximum: 255}
  validates :asin, presence: true, uniqueness: true, length: {maximum: 255}

  paginates_per 12

  class << self
    def build_with_items(keyword)
      return unless keyword

      items(keyword).each_with_object([]) do |item, products|
        product = Product.find_by(asin: item.dig('ASIN'))
        product ||= Product.new(formatted_item(item))
        products << product
      end
    end

    def items(keyword)
      request.search_items(
        keywords: keyword,
        # MEMO: 日本対応のインデックス
        # https://webservices.amazon.com/paapi5/documentation/locale-reference/japan.html
        search_index: 'HealthPersonalCare',
        # MEMO: 親のノードを指定すると子のノードを取得できる
        # シナリオごとのノード https://webservices.amazon.com/paapi5/documentation/use-cases.html
        resources: [
          'ItemInfo.Title',
          'ItemInfo.ByLineInfo',
          'Images.Primary.Large',
          'Offers.Listings.Price'
        ],
      ).to_h.dig('SearchResult', 'Items')
    end

    def request
      @request ||= Vacuum.new(
        marketplace: 'JP',
        access_key: ENV['AWS_ACCESS_KEY_ID'],
        secret_key: ENV['AWS_SECRET_KEY'],
        partner_tag: ENV['ASSOCIATE_TAG'],
      )
    end

    def formatted_item(item)
      {
        title: item.dig('ItemInfo', 'Title', 'DisplayValue'),
        image_url: item.dig('Images', 'Primary', 'Large', 'URL'),
        url: item.dig('DetailPageURL'),
        asin: item.dig('ASIN'),
        brand_amazon_name: item.dig('ItemInfo', 'ByLineInfo', 'Brand', 'DisplayValue'),
        price: item.dig('Offers', 'Listings', 0, 'Price', 'Amount')
      }
    end
  end
end
