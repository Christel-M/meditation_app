class PagesController < ApplicationController
  def home
    if logged_in?
      @user = User.find(session[:user_id])
      @user_blogs = Blog.where(user_id: @user.id)
      @blogs = Blog.all
      @chats = Chat.all
    end
  end
end
