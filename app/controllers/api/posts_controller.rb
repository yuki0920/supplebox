# frozen_string_literal: true

module Api
  class PostsController < ApplicationController
    before_action :require_user_logged_in, only: %i(create)

    def index
      @posts = if params[:limit].present?
                 Post.limit(params[:limit])
               else
                 Post
               end

      @posts = @posts.order(created_at: :desc).includes(:user, :product)

      render 'index.json.jb'
    end

    def create
      post = current_user.posts.build(post_params)

      if post.save
        render json: {message: 'Post created successfully'}
      else
        render json: {message: post.errors.full_messages.join('、')}, status: :bad_request
      end
    end

    private

    def post_params
      params.require(:posts).permit(:product_id, :title, :content, :rate, :picture)
    end
  end
end
