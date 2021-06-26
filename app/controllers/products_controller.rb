# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :require_user_logged_in, only: %i[new]
  before_action :set_product, only: %i[show]

  def new
  end

  def show
    @post = Post.new
    @posts = Post.includes(:user, :product).where(product_id: @product.id).page(params[:page])
  end

  def index
    @q = Product.all.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page])
    @ranking_counts = Product.ranking
    @query_params = request.query_parameters
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
