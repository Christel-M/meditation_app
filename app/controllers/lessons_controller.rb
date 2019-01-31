class LessonsController < ApplicationController

  def index
    @lessons = Lesson.order(Level_id: :asc)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def beginner
    @beg_lessons = Lesson.where(level_id: 1)
  end

  def intermediate
    @int_lessons = Lesson.where(level_id: 2)
  end

  def advanced
    @adv_lessons = Lesson.where(level_id: 3)
  end

end
