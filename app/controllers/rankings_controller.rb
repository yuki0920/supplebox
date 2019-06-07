class RankingsController < ApplicationController
  def like
    @ranking_counts = Like.ranking
    @products = Product.find(@ranking_counts.keys)
  end
end
