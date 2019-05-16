class ProductsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:edit, :update, :destroy]
  
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

      # アイテムのタイトル,画像URL, 詳細ページURLの取得
      @products = []
      products.items.each do |item|
        product = Product.find_or_initialize_by(asin: item.get('ASIN')) #アイテムにユニークなコードで探索
        product.title = item.get('ItemAttributes/Title') #アイテムタイトル
        product.image_url = item.get('LargeImage/URL') #アイテム画像URL
        product.url =  item.get('DetailPageURL') #アイテム詳細URL
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
        flash[:success] = 'アイテムを登録しました'
        redirect_back(fallback_location: root_path)
      end
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
        flash[:success] = 'アイテムを更新しました'
        redirect_to @product
    else
        render :edit
        flash.now[:danger] = 'アイテムの更新に失敗しました'
    end
  end
  
  def destroy
    @product = Product.find_by(id: params[:product_id])
    if @product.destroy
      flash[:success] = 'アイテムを削除しました'
    end
    redirect_back(fallback_location: root_path)
  end
  
  def show
    @product = Product.find(params[:id])
    @post = Post.new
    @posts = Post.where(product_id: @product.id).page(params[:page])
    if @product.brand_id?
      @brand = Brand.find(@product.brand_id)
    end

  end
  
  def index
    @q = Product.all.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page])
  end
  
  private
  
  def product_params
    params.require(:product).permit(:title, :url, :image_url, :asin, :price, :brand_amazon_name, :official_url, :brand_id, :category_id)
  end
end
