# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_user_logged_in, only: %i[edit]

  def show
    @user = User.find(params[:id])
  end

  def new; end

  def edit
    user = User.find(params[:id])
    redirect_to(current_user) unless user == current_user
  end

  def like_products
    @user = User.find(params[:id])
  end
end
