# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :require_user_logged_in, only: %i[new create edit update destroy]
  before_action :correct_user, only: %i[edit update]
  before_action :set_post, only: %i[edit update destroy]

  def new; end

  def create
    @product = Product.find(params[:post][:product_id])
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '口コミを投稿しました'
      redirect_to @product
    else
      flash.now[:danger] = '口コミの投稿に失敗しました'
      render 'products/show'
    end
  end

  def destroy
    return unless @post.destroy

    flash[:success] = '口コミを削除しました'
    redirect_back(fallback_location: root_path)
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:success] = '口コミを更新しました'
      redirect_to @post.product
    else
      flash.now[:danger] = '口コミの編集に失敗しました'
      render :edit
    end
  end

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user, :product).order(created_at: :desc).page(params[:page])
  end

  private

  def post_params
    params.require(:post).permit(:title, :rate, :content, :picture, :product_id)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to posts_path if @post.nil?
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
