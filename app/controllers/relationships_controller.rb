# frozen_string_literal: true

class RelationshipsController < ApplicationController
  before_action :require_user_logged_in

  def create
    # user = User.find(params[:follow_id])
    # current_user.follow(user)
    # flash[:success] = 'ユーザーをフォローしました。'
    # redirect_back(fallback_location: root_path)
    @user = User.find(params[:follow_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    # user = User.find(params[:follow_id])
    # current_user.unfollow(user)
    # flash[:success] = 'ユーザーのフォローを解除しました。'
    # redirect_back(fallback_location: root_path)
    @user = User.find(params[:follow_id])
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
