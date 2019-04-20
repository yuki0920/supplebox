class LikesController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    current_user.like(product)
    flash[:success] = 'お気に入り登録をしました。'
    redirect_back(fallback_location: root_path)    
  end
  
  def destroy
    product = Product.find(params[:product_id])
    current_user.unlike(product)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
