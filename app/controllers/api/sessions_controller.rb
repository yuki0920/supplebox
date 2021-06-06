# frozen_string_literal: true

module Api
  class SessionsController < ApplicationController
    def show
      user = current_user ? {name: current_user.name, path: user_path(current_user)} : nil

      render json: {user: user}
    end
  end
end
