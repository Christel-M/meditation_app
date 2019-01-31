class PagesController < ApplicationController
  def home
    if logged_in?
      @user = User.find(session[:user_id])
      @user_blogs = Blog.where(user_id: @user.id)
      @blogs = Blog.all
      @chats = Chat.all
      @user_lessons = Lesson.where(level_id: @user.level_id)
    end
  end
end
