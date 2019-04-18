class Product < ApplicationRecord
  validates :asin, uniqueness: true
  has_many :posts
end
