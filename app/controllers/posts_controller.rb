class PostsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
  end

  def create
    @product = Product.find(params[:post][:product_id])
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '口コミを投稿しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  end

  def show
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :rate, :content, :product_id)
  end
end
