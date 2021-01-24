# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    def index
      page = (params[:page] || 1).to_i
      next_page = page + 1
      pagination = {next: users_path(page: next_page)}
      users = User.page(page)

      render json: users, root: :users, each_serializer: UsersSerializer, meta: pagination, meta_key: :pagination
    end
  end
end
