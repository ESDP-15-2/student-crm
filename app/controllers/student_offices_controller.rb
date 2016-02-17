class StudentOfficesController < ApplicationController
  add_breadcrumb '<i class="fa fa-home"></i> Главная'.html_safe, :authenticated_root_url

  def get_course_group
    current_user.groups.each do |g|
      group = g.id
      course = g.id
      return course, group
    end
  end

  def array_periods(status)
    array_periods = []
    periods = Period.where("#{status}": true, group_id: get_course_group[1])
    periods.each do |period|
      if (period.commence_datetime < Time.now) && (period.hw_deadline > Time.now)
        array_periods.push period
      end
    end
    return array_periods
  end

  def user_home_periods(i)
    user_home_periods = []
    @user_hws = i.where(user_id: current_user.id)
    @user_hws.each do |hw|
      user_home_periods.push hw.period
    end
    return user_home_periods
  end

  def all_periods
    add_breadcrumb 'Домашние задания', :all_periods_url
    @periods = array_periods('hw_status') - user_home_periods(Homework)
  end

  def all_cws
    @periods = array_periods('cw_status') - user_home_periods(ControlWork)
    @user_cws = ControlWork.where(user_id: current_user.id)
  end

  def show_one_period
    @period = Period(params[:id])
    @homework = Homework.new
  end
end