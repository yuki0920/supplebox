class Like < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :user_id, presence: true
  validates :product_id, presence: true
  
  def self.ranking
    self.group(:product_id).order('count_product_id DESC').count(:product_id)
  end

  def self.ranking_top
    self.group(:product_id).order('count_product_id DESC').limit(4).count(:product_id)
  end    
end
