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
      current_user.posts.create!(post_params)

      render json: {message: 'Post created successfully'}
    end

    private

    def post_params
      params.require(:posts).permit(:product_id, :title, :content, :rate, :picture)
    end
  end

end
