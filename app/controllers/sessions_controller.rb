class SessionsController < ApplicationController
  before_action :reset_session

  def login
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Hello #{user.first_name}"
      redirect_to root_path
    else
      flash[:error] = 'Invalid email/password combination'
      render 'login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
