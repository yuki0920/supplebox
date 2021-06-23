# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :require_user_logged_in, only: %i[edit]
  before_action :correct_user, only: %i[edit]
  before_action :set_post, only: %i[edit]

  def edit; end

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
