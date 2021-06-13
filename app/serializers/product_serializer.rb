# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :image_url, :brand_amazon_name, :product_link, :post_count, :rate, :likes

  def product_link
    product_path(object)
  end

  def post_count
    object.posts.size
  end

  def rate
    if object.posts.present?
      (object.posts.pluck(:rate).sum / post_count).round(1)
    else
      0
    end
  end

  def likes
    object.likes.size
  end
end
