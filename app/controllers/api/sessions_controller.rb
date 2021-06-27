# frozen_string_literal: true

module Api
  class SessionsController < ApplicationController
    def show
      user = current_user ? {id: current_user.id, name: current_user.name, path: user_path(current_user)} : nil

      render json: {user: user}
    end

    def create
      email = params[:session][:email].downcase
      password = params[:session][:password]
      if login(email, password)
        render json: {message: 'Login successfully'}
      else
        render json: {message: 'Login failed'}, status: :bad_request
      end
    end

    def destroy
      session[:user_id] = nil

      render json: {message: 'Logged out successfully'}
    end

    private

    def login(email, password)
      @user = User.find_by(email: email)
      return false unless @user&.authenticate(password)

      session[:user_id] = @user.id
      true
    end
  end
end
