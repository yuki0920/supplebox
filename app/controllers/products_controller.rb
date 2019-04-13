class ProductsController < ApplicationController
  def new
    if params[:keyword].present?
      #　デバックログ出力するために記述
      Amazon::Ecs.debug = true

      # Amazon::Ecs::Responceオブジェクトの取得
      products = Amazon::Ecs.item_search(
        params[:keyword],
        search_index: 'HealthPersonalCare',
        dataType: 'script',
        response_group: 'Large',
        country: 'jp',
      )

      # 本のタイトル,画像URL, 詳細ページURLの取得
      @products = []
      products.items.each do |item|
        product = Product.new(
          item.get('ItemAttributes/Title'),
          item.get('LargeImage/URL'),
          item.get('DetailPageURL'),
          item.get('ASIN'),
        )
        @products << product
      end
    end
  end
end
