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
        product = Product.find_or_initialize_by(asin: item.get('ASIN')) #商品にユニークなコードで探索
        product.title = item.get('ItemAttributes/Title') #商品タイトル
        product.image_url = item.get('LargeImage/URL') #商品画像URL
        product.url =  item.get('DetailPageURL') #商品詳細URL
        product.brand_amazon_name = item.get('ItemAttributes/Brand') #ブランド(メーカー)
        product.price = item.get('OfferSummary/LowestNewPrice/Amount') #実売価格を¥表示

        @products << product
      end
    end
  end
  
  def create
    @product = Product.find_or_initialize_by(asin: params[:product_asin])
    unless @product.persisted?
      # @product が保存されていない場合、先に @product を保存する
      products = Amazon::Ecs.item_lookup(
        params[:product_asin],
        response_group: 'Medium',
        country: 'jp'
      )
  
      products.items.each do |item|
        @product = Product.new(
          title: item.get('ItemAttributes/Title'),
          image_url: item.get('LargeImage/URL'),
          url: item.get('DetailPageURL'),
          asin: item.get('ASIN'),
          brand_amazon_name: item.get('ItemAttributes/Brand'), 
          price: item.get('OfferSummary/LowestNewPrice/Amount'), 
        )
      end
      if @product.save
      flash[:success] = '商品を登録しました'
      end
    end
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @product = Product.find_by(id: params[:product_id])
    if @product.destroy
      flash[:success] = '商品を削除しました'
    end
    redirect_back(fallback_location: root_path)
  end
  
  def show
    @product = Product.find(params[:id])
    @post = Post.new
    @posts = Post.where(product_id: @product.id)
  end
end
