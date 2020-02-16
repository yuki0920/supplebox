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

    def build_with_items(keyword)
      items(keyword).items.each_with_object([]) do |item, products|
        product = Product.find_by(asin: item.get('ASIN'))
        product ||= Product.new(formatted_item(item))
        products << product
      end
    end

    def items(keyword)
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

    def item(asin)
      formatted_item(Amazon::Ecs.item_lookup(
                      asin,
                      response_group: 'Medium',
                      country: 'jp'
                    ).get_element('Item'))
    end

    def build_with_item(asin)
      Product.new(item(asin))
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
