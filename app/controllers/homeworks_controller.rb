class HomeworksController < ApplicationController
  def new
    @homework = Homework.new
  end

  def create
    @homework = Homework.new(homework_params)
    set_homework_name
    @homework.user = current_user

    if @homework.save
      redirect_to homeworks_url
    else
      render 'new'
    end
  end

  def index
    @homeworks = Homework.all
  end

  def edit
    @homework = Homework.find(params[:id])
  end

  def update
    @homework = Homework.find(params[:id])
    if @homework.update(homework_params)
      redirect_to homeworks_url
    else
      render 'edit'
    end
  end
  def show
    @homework = Homework.find(params[:id])
  end

  def destroy
    @homework = Homework.find(params[:id])
    @homework.destroy
    redirect_to homeworks_url
  end

  private

  def get_course_group_name
    group_name = ''
    course_name = ''
    current_user.groups.each do |g|
      group_name = g.name.to_s
      course_name = g.course.name.to_s
    end
    return course_name, group_name
  end

  def set_homework_name
    name = current_user.name.to_s
    surname = current_user.surname.to_s
    course_group_name = get_course_group_name.join('-')
    period_tittle = @homework.period.title.to_s
    hw_archive_name = name + "-#{surname}" + "-#{course_group_name}" + "-#{period_tittle}"
    @homework.hw_archive_file_name = hw_archive_name
  end

  def homework_params
    params.require(:homework).permit( :rating, :review, :hw_archive, :period_id, :user_id)
  end
end
