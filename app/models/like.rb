# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :user_id, presence: true
  validates :product_id, presence: true

  def self.ranking
    group(:product_id).order('count_product_id DESC').limit(12).count(:product_id)
  end

  def self.ranking_top
    group(:product_id).order('count_product_id DESC').limit(4).count(:product_id)
  end
end
