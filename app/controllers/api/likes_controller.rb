# frozen_string_literal: true

module Api
  class LikesController < ApplicationController
    before_action :require_user_logged_in, only: %i[create destroy]

    def create
      product = Product.find(params[:product_id])
      current_user.like!(product)

      render json: {message: 'Product has been liked successfully'}
    end

    def destroy
      product = Product.find(params[:product_id])

      current_user.unlike!(product)
      render json: {message: 'Product has been unliked successfully'}
    end
  end
end
