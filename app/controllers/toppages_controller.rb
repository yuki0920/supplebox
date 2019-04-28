class ToppagesController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc).limit(3)
    @ranking_counts = Like.ranking_top
    @products = Product.find(@ranking_counts.keys)
  end
  
  def policy
  end
  
  def privacypolicy
  end
end
