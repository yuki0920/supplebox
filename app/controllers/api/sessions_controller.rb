# frozen_string_literal: true

module Api
  class SessionsController < ApplicationController
    def show
      if current_user
        render 'show.json.jb'
      else
        render json: {user:  nil}
      end
    end

    def create
      email = params[:session][:email].downcase
      password = params[:session][:password]
      if login(email, password)
        render 'show.json.jb'
      else
        render json: {message: 'Login failed'}, status: :bad_request
      end
    end

    def destroy
      session[:user_id] = nil

      render json: {message: 'Logged out successfully'}
    end

    def test_user
      @user = User.find_by(email: 'test@supplebox.jp')

      session[:user_id] = @user.id

      render 'show.json.jb'
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
