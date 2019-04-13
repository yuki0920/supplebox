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
        response_group: 'Medium',
        country: 'jp',
      )

      # 商品のタイトル,画像URL, 詳細ページURLの取得
      @products = []
      products.items.each do |item|
        product = Product.new(
          item.get('ItemAttributes/Title'), #商品タイトル
          item.get('LargeImage/URL'), #商品画像URL
          item.get('DetailPageURL'), #商品詳細URL
          item.get('ASIN'), #商品にユニークなコード
          item.get('ItemAttributes/Brand'), #ブランド(メーカー)
          item.get('OfferSummary/LowestNewPrice/FormattedPrice'), #公式価格を¥表示
        )
        @products << product
      end
    end
  end
end
