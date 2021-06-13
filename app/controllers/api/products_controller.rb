# frozen_string_literal: true

module Api
  class ProductsController < ApplicationController
    before_action :set_product, only: %i(show)

    def index
      products =
        if params[:q].present?
          Product.where(['title LIKE ?', "%#{params[:q]}%"]).or(Product.where(['brand_amazon_name LIKE ?', "%#{params[:q]}%"]))
        else
          Product.all
        end

      products = if params[:limit].present?
                  products.limit(params[:limit])
                 else
                  products.includes(:posts, :likes).page(params[:page])
                 end

      render json: products, each_serializer: ProductSerializer
    end

    def show
      render json: @product
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end
  end
end
