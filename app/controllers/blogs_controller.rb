class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @user = User.find(session[:user_id])
    @user.blogs << @blog
    if @blog.valid?
      @blog.save
      flash[:notice] = "Blog Created"
      redirect_to users_path
    else
      puts @blog.errors.messages
      flash[:notice] = "#{@blog.errors.messages}"
      render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
        flash[:notice] = "Blog Modified"
        redirect_to @blog
      else
        render 'new'
        puts "#{@blog.errors.messages}"
      end
  end

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
    @related_blogs = Blog.where(tags: @blog )
  end

  private

  def blog_params
      params.require(:blog).permit(:title, :description, :tags)
  end

end
