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
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = '口コミを削除しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @post = Post.find(params[:id])
    @product = Product.find(@post.product_id)
    @user = User.find(@post.user_id)
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = '口コミを更新しました'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(12)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :rate, :content, :picture, :product_id)
  end
end
