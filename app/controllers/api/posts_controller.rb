# frozen_string_literal: true

module Api
  class PostsController < ApplicationController
    before_action :require_user_logged_in, only: %i(create update destroy)

    def index
      @posts = params[:user_id] ? Post.where(user_id: params[:user_id]) : Post
      @posts = @posts.where(product_id: params[:product_id]) if params[:product_id]
      @posts = @posts.page(params[:page]).per(params[:per])
      @posts = @posts.order(created_at: :desc).includes(:user, :product)

      render 'index.json.jb'
    end

    def create
      post = current_user.posts.build(create_post_params)

      if post.save
        render json: {message: 'Post created successfully'}
      else
        render json: {message: post.errors.full_messages.join('、')}, status: :bad_request
      end
    end

    def update
      post = Post.find(params[:id])

      if post.update(update_post_params)
        render json: {message: 'Post updated successfully'}
      else
        render json: {message: post.errors.full_messages.join('、')}, status: :bad_request
      end
    end

    def show
      @post = Post.find(params[:id])

      render 'show.json.jb'
    end

    def destroy
      post = Post.find(params[:id])

      return unless post.user == current_user

      post.destroy

      render json: {message: 'Post deleted successfully'}
    end

    private

    def create_post_params
      params.require(:post).permit(:product_id, :title, :content, :rate, :picture)
    end

    def update_post_params
      params.require(:post).permit(:title, :content, :rate, :picture)
    end
  end
end
