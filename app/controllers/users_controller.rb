# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show like_products]
  before_action :require_user_logged_in, only: %i[edit update]
  before_action :correct_user, only: %i[edit update]

  def show
    @posts = Post.includes(:user, :product).where(user_id: @user.id).page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'プロフィールを更新しました'
      redirect_to @user
    else
      flash.now[:danger] = 'プロフィールの更新に失敗しました'
      render :edit
    end
  end

  def like_products
    @products = @user.products.page(params[:page])
    counts(@user)
    @ranking_counts = Product.ranking
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation, :nickname,
      :gender, :height, :weight, :comment, :picture
    )
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(current_user) unless @user == current_user
  end

  def set_user
    @user = User.find(params[:id])
  end
end
