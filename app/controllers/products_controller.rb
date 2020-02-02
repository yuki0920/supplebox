# frozen_string_literal: true

class ProductsController < ApplicationController
  include SearchAmazon

  before_action :require_user_logged_in, only: %i[new create edit update destroy]
  before_action :admin_user, only: %i[edit update destroy]
  before_action :set_product, only: %i[edit update show]

  def new
    @products = search_products(params[:keyword])
  end

  def create
    @product = search_product(params[:product_asin])
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
end
