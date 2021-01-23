# frozen_string_literal: true

class Api::ProductsController < ApplicationController
  before_action :set_product, only: %i(show)

  def show
    render json: @product
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
