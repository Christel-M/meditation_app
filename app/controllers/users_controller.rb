class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      log_in @user
      flash[:success] = "Welcome #{@user.first_name}"
      redirect_to root_path
    else
      p @user.errors.messages
      flash[:error] = "#{@user.errors.messages}"
      redirect_to '/signup'
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to root_path
    end
  end

  def destroy
    @user =  User.find(params[:id])
    if @user.destroy
      session.delete[:user_id]
      redirect_to root_path
    end
    @user_blogs = Blog.where(user_id: @user.id)
    respond_to do |format|
      format.html
      format.js
    end
    @blog.destroy
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User Information Updated"
      redirect_to @user
    end
  end

  def index
    @user = User.find(session[:user_id])
    @user_blogs = Blog.where(user_id: @user.id)
  end

  def show
    @user = User.find_by(id: params[:id])
    @recent_blogs = Blog.where(user_id: @user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :level_id, :location_name, :profile_picture, :cover_picture)
  end

end
