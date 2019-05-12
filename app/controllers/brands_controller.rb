class BrandsController < ApplicationController
  before_action :require_user_logged_in , only: [:new, :ceate, :edit, :update, :destroy ]
  before_action :admin_user , only: [:new, :ceate, :edit, :update, :destroy ]
  
  def index
    @brands = Brand.page(params[:page]).per(9)
  end
  
  def show
    @brand = Brand.find(params[:id])
    @products = Product.where(brand_id: @brand.id)
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
  
  def edit
    @brand = Brand.find(params[:id])
  end
  
  def update
    @brand = Brand.find(params[:id])
    if @brand.update(brand_params)
      flash[:success] = 'ブランドを更新しました'
      redirect_to @brand
    else
      render :new
      flash.now[:danger] = 'ブランドの更新に失敗しました'
    end
  end
  
  def destroy
    @brand = Brand.find(params[:id])
    if @brand.destroy
      flash[:success] = 'ブランドを削除しました'
      redirect_to root_url
    end
  end
  
  
  private
  
  def brand_params
    params.require(:brand).permit(:name, :content, :picture)
  end
  
end
