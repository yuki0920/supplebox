# frozen_string_literal: true

class Product < ApplicationRecord
  # 商品登録用
  validates :title, presence: true, length: {maximum: 255}
  ## urlは255字以上のためデータ型が'text
  validates :url, presence: true
  validates :image_url, presence: true, length: {maximum: 255}
  ## ASINコードで一意に識別
  validates :asin, presence: true, uniqueness: true, length: {maximum: 255}

  # ページネーションの表示件数追加
  paginates_per 12

  # 口コミ投稿との関連付け
  has_many :posts, dependent: :destroy

  # ブランドとの関連付け
  belongs_to :brand, optional: true

  # お気に入り機能追加用中間テーブル追加
  has_many :likes, foreign_key: 'product_id', dependent: :destroy
  has_many :users, through: :likes

  class << self
    # お気に入り数表示
    def ranking
      group(:id).order('brand_id').count(:id)
    end

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
        ]
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
        price: item.dig('Offers', 'Listings', 0, 'Price', 'Amount'),
      }
    end
  end
end
