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
      redirect_to myblogs_path
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

  def destroy
    @blog = Blog.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
    @blog.destroy
  end

  def index
    if params[:title]
      @blogs = Blog.where('title LIKE ?', "%#{params[:title]}%")
    else
      @blogs = Blog.all
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @recent_blogs = Blog.order(created_at: :desc)
  end

  private

  def blog_params
      params.require(:blog).permit(:title, :description, :tags, :image)
  end

end
