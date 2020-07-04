# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :require_user_logged_in, only: %i[create destroy]

  def create
    @product = Product.find(params[:product_id])
    current_user.like(@product)
    respond_to do |format|
      format.html do
        flash[:success] = 'お気に入り登録をしました。'
        redirect_back(fallback_location: root_path)
      end
      format.js
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    current_user.unlike(@product)
    respond_to do |format|
      format.html do
        flash[:success] = 'お気に入り登録を解除しました。'
        redirect_back(fallback_location: root_path)
      end
      format.js
    end
  end
end
