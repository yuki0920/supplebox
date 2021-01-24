# frozen_string_literal: true

class UsersSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :nickname, :gender, :height, :weight, :comment, :user_link, :picture_url

  def user_link
    user_path(object)
  end

  def picture_url
    object.picture.url
  end
end
