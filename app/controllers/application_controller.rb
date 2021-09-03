# frozen_string_literal: true

# NOTE: セッションを扱うため ActionController::API を継承していない
class ApplicationController < ActionController::Base
  include SessionsHelper

  def require_user_logged_in
    return if logged_in?

    head :forbidden
  end

  def render_errors(object)
    render json: {errors: object.errors.full_messages.join('、')}, status: :bad_request
  end

  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
