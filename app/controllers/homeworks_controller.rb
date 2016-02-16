class HomeworksController < ApplicationController

  add_breadcrumb '<i class="fa fa-home"></i> Главная'.html_safe, :authenticated_root_url
  add_breadcrumb 'Домашние задания', :homeworks_url

  def new
    @homework = Homework.new
    add_breadcrumb 'Новое домашнее задание', :new_homework_url
  end

  def create
    #@homework = Homework.new(homework_params)
    @period = Period.find(params[:period_id])
    @homework = @period.homeworks.create(homework_params)
    set_homework_name
    @homework.user = current_user
    if @homework.save
      @homework.period.update_attribute(:hw_status, true)
      redirect_to all_periods_url
    else
      render 'new'
    end
  end

  def create_hw_with_period
    @homework = Homework.new
    @period = Period.find(params[:id])
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
      redirect_to all_periods_url
    else
      render 'edit'
    end
  end

  def destroy
    @homework = Homework.find(params[:id])
    @homework.destroy
    redirect_to homeworks_url
  end

  def rate_homework
    @homework = Homework.find(params[:id])
  end

  def reload_homework
    @homework = Homework.find(params[:id])
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
