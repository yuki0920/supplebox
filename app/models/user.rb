# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :products, through: :likes

  before_save { email.downcase! }
  validates :name, presence: true, length: {maximum: 50}
  validates :nickname, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}, allow_nil: true
  validates :comment, length: {maximum: 100}
  mount_uploader :picture, AvatarUploader

  def like!(product)
    likes.create!(product_id: product.id)
  end

  def unlike!(product)
    like = likes.find_by!(product_id: product.id)

    like.destroy
  end

  def like?(product)
    products.include?(product)
  end
end
