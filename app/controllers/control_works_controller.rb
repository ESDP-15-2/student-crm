class ControlWorksController < ApplicationController
  def index
    @courses = Course.all
  end
  def new
    @control_work = ControlWork.new
    add_breadcrumb 'Новое домашнее задание', :new_homework_url
  end

  def create
    #@homework = Homework.new(homework_params)
    @period = Period.find(params[:period_id])
    @control_work = @period.control_works.create(cw_params)
    set_cw_name
    @control_work.user = current_user
    if @control_work.save
      @control_work.period.update_attribute(:cw_status, true)
      redirect_to all_cws_url
    else
      render 'new'
    end
  end

  def create_cw_with_period
    @control_work = ControlWork.new
    @period = Period.find(params[:id])
  end


  def edit
    @control_work = ControlWork.find(params[:id])
  end

  def update
    @control_work = ControlWork.find(params[:id])
    if @control_work.update(cw_params)
      redirect_to all_cws_url
    else
      render 'edit'
    end
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

  def set_cw_name
    name = current_user.name.to_s
    surname = current_user.surname.to_s
    course_group_name = get_course_group_name.join('-')
    period_tittle = @control_work.period.title.to_s
    cw_archive_name = name + "-#{surname}" + "-#{course_group_name}" + "-#{period_tittle}"
    @control_work.cw_archive_file_name = cw_archive_name
  end

  def cw_params
    params.require(:control_work).permit(:rating, :review, :cw_archive, :period_id, :user_id)
  end
end
