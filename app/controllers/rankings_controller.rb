class RankingsController < ApplicationController
  def like
    @ranking_counts = Like.ranking
    @products = Product.find(@ranking_counts.keys)
    @products = Kaminari.paginate_array(@products).page(params[:page]).per(10)
  end
end
