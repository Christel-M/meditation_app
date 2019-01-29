class UsersController < ApplicationController
  def new
    @user = User.new
    # if logged_in?
    #   redirect_to root_path
    # else
    #   render 'new'
    # end
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      log_in @user
      flash[:success] = "Account Created"
      redirect_to root_path
    else
      p @user.errors.messages
      flash[:error] = "#{@user.errors.messages}"
      render 'new'
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
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User Information Updated"
      redirect_to @user
    end
  end

  def index
    if logged_in?
      @user = User.find(session[:user_id])
      @user_blogs = Blog.where(user_id: @user.id)
    else
      redirect_to login_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :level_id, :location_name)
  end

end
