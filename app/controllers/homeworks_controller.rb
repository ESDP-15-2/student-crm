class HomeworksController < ApplicationController

  add_breadcrumb '<i class="fa fa-home"></i> Главная'.html_safe, :authenticated_root_url

  def index
    add_breadcrumb 'Домашние задания: Курс', :homeworks_url
    @courses = Course.all
  end

  def get_group_homework
    add_breadcrumb 'Домашние задания: Курс', :homeworks_url
    add_breadcrumb 'Группа', :get_group_homework_url
    @course = Course.find(params[:id])
    @groups = Group.where(course: @course)
  end

  def all_units_for_hw
    add_breadcrumb 'Модули', :all_units_for_hw_url
    group = Group.find(params[:id])
    @academic_units = AcademicUnit.where(group: group)
  end

  def periods_for_group
    academic_unit = AcademicUnit.find(params[:id])
    @periods = Period.where(academic_unit:academic_unit)
  end

  def hws_for_period
    period = Period.find(params[:id])
    @homeworks = Homework.where(period: period)
  end

  def all_courses_hws
    @courses = Course.all
  end

  def new
    @homework = Homework.new
    add_breadcrumb 'Новое домашнее задание', :new_homework_url
  end

  def create
    #@homework = Homework.new(homework_params)
    @period = Period.find(params[:period_id])
    @homework = Homework.new(homework_params)
    @homework.period = @period
    set_homework_name @homework
    @homework.user = current_user
    if @homework.save
      @homework.period.update_attribute(:hw_status, true)
      redirect_to all_periods_url
    else
      render 'new'
    end
  end

  def create_hw_with_period
    add_breadcrumb 'Домашние задания', :all_periods_url
    add_breadcrumb 'Загрузка', :create_hw_with_period_url
    @homework = Homework.new
    @period = Period.find(params[:id])
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

  def update_rate_hw
    @homework = Homework.find(params[:id])
    if @homework.update(homework_params)
      redirect_to hws_for_period_url(@homework.period.id)
    else
      render 'edit'
    end
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

  def set_homework_name(hw)
    name = current_user.name.to_s
    surname = current_user.surname.to_s
    course_group_name = get_course_group_name.join('-')
    period_tittle = @homework.period.title.to_s
    hw_archive_name = name + "-#{surname}" + "-#{course_group_name}" + "-#{period_tittle}"
    hw.hw_archive_file_name = hw_archive_name
  end

  def homework_params
    params.require(:homework).permit(:rating, :review, :hw_archive, :period_id, :user_id)
  end
end
