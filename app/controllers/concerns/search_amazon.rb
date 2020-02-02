# frozen_string_literal: true

module SearchAmazon
  extend ActiveSupport::Concern

  def search_products(keyword)
    load_products(keyword).items.each_with_object([]) do |item, result|
      product = Product.find_by(asin: item.get('ASIN'))
      product = Product.new(load_product_params(item)) if product.blank?
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
    Product.new(load_product_params(item))
  end

  def load_product_params(item)
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
