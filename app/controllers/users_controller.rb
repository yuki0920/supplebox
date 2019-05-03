class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]  
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(10)
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id  #新規登録時にログイン状態になる
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def index
    @users = User.all.page(params[:page]).per(10)
  end
  
  def edit
    @user = User.find(params[:id])
  
  end  
  
  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    flash[:success] = 'プロフィールを更新しました'
    redirect_to @user
   else
     flash.now[:danger] = 'プロフィールの更新に失敗しました'
     render :edit
   end
  end
  
  def like_products
    @user = User.find(params[:id])
    @products = @user.products.page(params[:page]).per(10)
    counts(@user)
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page]).per(10)
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page]).per(12)
    counts(@user)
  end  
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :nickname, :gender, :height, :weight, :comment)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(current_user) unless @user == current_user
  end
  
end
