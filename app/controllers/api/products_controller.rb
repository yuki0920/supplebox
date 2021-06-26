# frozen_string_literal: true

module Api
  class ProductsController < ApplicationController
    before_action :require_user_logged_in, only: %i(new)

    def index
      @products =
        if params[:q].present?
          Product.where(['title LIKE ?', "%#{params[:q]}%"]).or(Product.where(['brand_amazon_name LIKE ?', "%#{params[:q]}%"]))
        elsif params[:user_id].present?
          User.find(params[:user_id]).products
        else
          Product
        end

      @products = @products.page(params[:page]).per(params[:per]).includes(:posts, :likes)

      render 'index.json.jb'
    end

    def new
      @products = Product.build_with_items(params[:keyword])

      render 'new.json.jb'
    end

    def create
      product = Product.new(product_params)

      product.save!

      render json: {message: 'Product has been created successfully'}
    end

    private

    def product_params
      params.require(:product).permit(:title, :url, :image_url, :asin, :price, :brand_amazon_name)
    end
  end
end
