# frozen_string_literal: true

module Api
  class ProductsController < ApplicationController
    before_action :require_user_logged_in, only: %i(new)

    def index
      @products =
        if params[:q].present?
          Product.where(['title LIKE ?', "%#{params[:q]}%"]).or(Product.where(['brand_amazon_name LIKE ?', "%#{params[:q]}%"]))
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
  end
end
