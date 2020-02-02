# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :require_user_logged_in, only: %i[new create edit update destroy]
  before_action :admin_user, only: %i[edit update destroy]
  before_action :set_product, only: %i[edit update show]

  def new
    search_amazon(params[:keyword])
  end

  def create
    @product = Product.find_by(asin: params[:product_asin])
    lookup_amazon(params[:product_asin])
    @product.save
    flash[:success] = 'アイテムを登録しました'
    redirect_back(fallback_location: root_path)
  end

  def edit; end

  def update
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
    flash[:success] = 'アイテムを削除しました' if @product.destroy
    redirect_back(fallback_location: root_path)
  end

  def show
    @post = Post.new
    @posts = Post.includes(:user, :product).where(product_id: @product.id).page(params[:page])
    @brand = Brand.find(@product.brand_id) if @product.brand_id?
  end

  def index
    @q = Product.all.ransack(params[:q])
    @products = @q.result(distinct: true).order(:brand_id).page(params[:page])
    @ranking_counts = Product.ranking
  end

  private

  def product_params
    params.require(:product).permit(:title, :url, :image_url, :asin, :price, :brand_amazon_name, :official_url, :brand_id, :category_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def search_amazon(keyword)
    # 　デバックログ出力するために記述
    Amazon::Ecs.debug = true

    # Amazon::Ecs::Responceオブジェクトの取得
    response = Amazon::Ecs.item_search(
      keyword,
      search_index: 'HealthPersonalCare',
      dataType: 'script',
      response_group: 'Medium',
      country: 'jp'
    )

    @products = response.items.each_with_object([]) do |item, result|
      product = Product.find_by(asin: item.get('ASIN'))
      product = Product.new(load_product(item)) unless product.present?
      result << product
    end
  end

  def lookup_amazon(keyword)
    return if @product.present?

    response = Amazon::Ecs.item_lookup(
      keyword,
      response_group: 'Medium',
      country: 'jp'
    )
    item = response.get_element('Item')
    @product = Product.new(load_product(item))
  end

  def load_product(item)
      title =             item.get('ItemAttributes/Title') # アイテムタイトル
      image_url =         item.get('LargeImage/URL') # アイテム画像URL
      url =               item.get('DetailPageURL') # アイテム詳細URL
      asin =              item.get('ASIN') # アイテム詳細URL
      brand_amazon_name = item.get('ItemAttributes/Brand') # ブランド(メーカー)
      price =             item.get('OfferSummary/LowestNewPrice/Amount') # 実売価格を¥表示

      {
        title:             title,
        image_url:         image_url,
        url:               url,
        asin:              asin,
        brand_amazon_name: brand_amazon_name,
        price:             price
      }
  end
end
