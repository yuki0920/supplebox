# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user, optional: true

  before_save { email.downcase! }
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true
end
