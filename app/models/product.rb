class Product < ApplicationRecord
  validates :asin, uniqueness: true
end
