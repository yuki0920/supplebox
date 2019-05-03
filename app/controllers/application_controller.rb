class ApplicationController < ActionController::Base
  before_filter :ensure_domain
  protect_from_forgery with: :exception

  include SessionsHelper

  private
  
  # redirect correct server from herokuapp domain for SEO
  def ensure_domain
   return unless /\.herokuapp.com/ =~ request.host
  
   # 主にlocalテスト用の対策80と443以外でアクセスされた場合ポート番号をURLに含める 
   port = ":#{request.port}" unless [80, 443].include?(request.port)
   redirect_to "#{request.protocol}#{supplebox.jp}#{port}#{request.path}", status: :moved_permanently
  end  

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_posts = user.posts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_like_products = user.products.count
  end
end
