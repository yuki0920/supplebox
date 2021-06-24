# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :user_id, presence: true
  validates :product_id, presence: true

  scope :ranking, -> { group(:product_id).order(count_product_id: :desc) }

  def self.ranking_list
    ranking.limit(12).count(:product_id)
  end

  def self.ranking_top
    ranking.limit(4).count(:product_id)
  end
end
