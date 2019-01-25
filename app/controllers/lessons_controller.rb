class LessonsController < ApplicationController
  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.valid?
      @lesson.save
      redirect_to lessons_path
    else
      flash[:error] = "Error: #{@lesson.errors.full_messages}"
      render 'new'
    end
  end

  # def edit
  #   @lesson = Lesson.find(params[:id])
  # end
  #
  # def update
  #   @lesson = Lesson.find(params[:id])
  #   if @lesson.update(lesson_params)
  #     flash[:notice] = "Updated!"
  #     redirect_to lessons_path
  #   end
  # end

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  private
  def lesson_params
    params.require(:lesson).permit(:name, :content, :level_id)
  end

end
