# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    before_action :require_user_logged_in, only: %i[update]

    def show
      @user = User.find(params[:id])

      render 'show.json.jb'
    end

    def create
      user = User.new(new_user_params)

      if user.save
        session[:user_id] = user.id

        render json: {message: 'Logged in successfully'}
      else
        render json: {message: 'Log in failure'}, status: :bad_request
      end
    end

    def update
      user = User.find(params[:id])

      raise unless user == current_user

      if user.update(edit_user_params)
        render json: {message: 'Updated successfully'}
      else
        render json: {message: 'Update failure'}, status: :bad_request
      end
    end

    private

    def new_user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def edit_user_params
      params.require(:user).permit(:name, :gender, :height, :weight, :picture)
    end
  end
end
