# frozen_string_literal: true

class BrandsController < ApplicationController
  before_action :require_user_logged_in, only: %i[new ceate edit update destroy]
  before_action :admin_user, only: %i[new ceate edit update destroy]
  before_action :set_brand, only: %i[show edit update destroy]

  def index
    @q = Brand.ransack(params[:q])
    @brands = @q.result(distinct: true).page(params[:page])
  end

  def show
    @products = Product.where(brand_id: @brand.id)
    @ranking_counts = Product.ranking
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:success] = 'ブランドを登録しました'
      redirect_to root_path
    else
      render :new
      flash.now[:danger] = 'ブランドの登録に失敗しました'
    end
  end

  def edit; end

  def update
    if @brand.update(brand_params)
      flash[:success] = 'ブランドを更新しました'
      redirect_to @brand
    else
      render :new
      flash.now[:danger] = 'ブランドの更新に失敗しました'
    end
  end

  def destroy
    if @brand.destroy
      flash[:success] = 'ブランドを削除しました'
      redirect_to root_url
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :content, :picture)
  end

  def set_brand
    @brand = Brand.find(params[:id])
  end
end
