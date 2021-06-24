# frozen_string_literal: true

class RankingsController < ApplicationController
  def like
    @ranking_counts = Like.ranking_list
    @products = Product.find(@ranking_counts.keys)
  end
end
