class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 4)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 4)
  end
  
  def edit    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Allsport, #{@user.username} have been successfully signed up "
      redirect_to articles_path
    else
      render :new
    end
  end

  def update    
    if @user.update(user_params)
      flash[:notice] = "#{@user.username}, your profile have been successfully updated"
      redirect_to user_path(@user)
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end