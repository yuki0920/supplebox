# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  # before_filter :ensure_domain
  # FQDN = 'supplebox.jp'

  # redirect correct server from herokuapp domain for SEO
  # def ensure_domain
  # return unless /\.herokuapp.com/ =~ request.host

  # 主にlocalテスト用の対策80と443以外でアクセスされた場合ポート番号をURLに含める
  # port = ":#{request.port}" unless [80, 443].include?(request.port)
  # redirect_to "#{request.protocol}#{FQDN}#{port}#{request.path}", status: :moved_permanently
  # end

  def require_user_logged_in
    return if logged_in?

    store_location
    redirect_to login_url
  end

  def render_errors(object)
    render json: {errors: object.errors.full_messages.join('、')}, status: :bad_request
  end

  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
