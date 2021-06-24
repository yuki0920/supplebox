# frozen_string_literal: true

module Api
  class ProductsController < ApplicationController
    def index
      products =
        if params[:q].present?
          Product.where(['title LIKE ?', "%#{params[:q]}%"]).or(Product.where(['brand_amazon_name LIKE ?', "%#{params[:q]}%"]))
        else
          Product
        end

      products = products.page(params[:page]).per(params[:per]).includes(:posts, :likes).page(params[:page])

      render json: products, each_serializer: ProductSerializer
    end
  end
end
