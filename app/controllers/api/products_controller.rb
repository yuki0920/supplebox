# frozen_string_literal: true

module Api
  class ProductsController < ApplicationController
    def index
      @products =
        if params[:keyword].present?
          Product.where(['title LIKE ?',
                         "%#{params[:keyword]}%"]).or(Product.where(['brand_amazon_name LIKE ?', "%#{params[:keyword]}%"]))
        elsif params[:user_id].present?
          User.find(params[:user_id]).products
        else
          Product
        end

      @products = @products.includes(:posts, :likes).page(params[:page]).per(params[:per])

      render 'index.json.jb'
    end

    def show
      @product = Product.find(params[:id])

      render 'show.json.jb'
    end

    def new
      @products = Product.build_with_items(params[:keyword])

      render 'new.json.jb'
    end

    def create
      product = Product.new(product_params)

      if product.save
        render json: {message: 'Product has been created successfully'}
      else
        render_errors(product)
      end
    end

    private

    def product_params
      params.require(:product).permit(:title, :url, :image_url, :asin, :price, :brand_amazon_name)
    end
  end
end
