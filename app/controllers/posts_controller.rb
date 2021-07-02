# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :require_user_logged_in, only: %i[edit]

  def edit
    @post = current_user.posts.find(params[:id])

    redirect_to posts_path unless @post
  end

  def index; end
end
