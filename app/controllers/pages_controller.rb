class PagesController < ApplicationController
  def home
    if logged_in?
      @user = User.find(session[:user_id])
      @user_blogs = Blog.where(user_id: @user.id)
      p @user_blogs
    end
  end
end
