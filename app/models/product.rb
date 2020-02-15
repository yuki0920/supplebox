# frozen_string_literal: true

class Product < ApplicationRecord
  # 商品登録用
  validates :title, presence: true, length: { maximum: 255 }
  ## urlは255字以上のためデータ型が'text
  validates :url, presence: true
  validates :image_url, presence: true, length: { maximum: 255 }
  ## ASINコードで一意に識別
  validates :asin, presence: true, uniqueness: true, length: { maximum: 255 }

  # ページネーションの表示件数追加
  paginates_per 12

  # 口コミ投稿との関連付け
  has_many :posts

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

    def search_products(keyword)
      load_products(keyword).items.each_with_object([]) do |item, result|
        product = Product.find_by(asin: item.get('ASIN'))
        product = Product.new(formatted_item(item)) if product.blank?
        result << product
      end
    end

    def load_products(keyword)
      # 　デバックログ出力するために記述
      Amazon::Ecs.debug = true
      # Amazon::Ecs::Responceオブジェクトの取得
      Amazon::Ecs.item_search(
        keyword,
        search_index: 'HealthPersonalCare',
        dataType: 'script',
        response_group: 'Medium',
        country: 'jp'
      )
    end

    def search_product(keyword)
      response = Amazon::Ecs.item_lookup(
        keyword,
        response_group: 'Medium',
        country: 'jp'
      )

      item = response.get_element('Item')
      Product.new(formatted_item(item))
    end

    def formatted_item(item)
      {
        title: item.get('ItemAttributes/Title'),
        image_url: item.get('LargeImage/URL'),
        url: item.get('DetailPageURL'),
        asin: item.get('ASIN'),
        brand_amazon_name: item.get('ItemAttributes/Brand'),
        price: item.get('OfferSummary/LowestNewPrice/Amount')
      }
    end
  end
end
