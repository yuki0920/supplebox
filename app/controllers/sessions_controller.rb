# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    respond_to do |format|
      format.html do
        if login(email, password)
          flash[:success] = 'ログインに成功しました。'
          redirect_back_or @user
        else
          flash.now[:danger] = 'ログインに失敗しました。'
          render 'new'
        end
      end

      # TODO: エンドポイントを分けたい
      format.json do
        if login(email, password)
          render json: { message: 'Login successfully' }
        else
          render json: { message: 'Login failed' }, status: :bad_request
        end
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  private

  def login(email, password)
    @user = User.find_by(email: email)
    return false unless @user&.authenticate(password)

    session[:user_id] = @user.id
    true
  end
end
