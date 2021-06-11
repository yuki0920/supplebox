# frozen_string_literal: true

module Api
  class PostsController < ApplicationController
    def index
      @posts = if params[:limit].present?
        Post.limit(params[:limit])
      else
        Post
      end

      @posts = @posts.includes(:user, :product)

      render "index.json.jb"
    end
  end
end
