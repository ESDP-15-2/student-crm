class StudentOfficesController < ApplicationController

  def get_course_group
    group = ''
    course = ''
    current_user.groups.each do |g|
      group = g.id
      course = g.id
    end
    return course, group
  end

  def array_periods
    array_periods = []
    periods = Period.where(hw_status: true, group_id: get_course_group[0])
    periods.each do |period|
      if period.commence_datetime < Time.now
        array_periods.push period
      end
    end
    return array_periods
  end

  def user_home_periods
    user_home_periods = []
    @user_hws = Homework.where(user_id: current_user.id)
    @user_hws.each do |hw|
      user_home_periods.push hw.period
    end
    return user_home_periods
  end

  def all_periods
    @periods = array_periods - user_home_periods
  end

  def show_one_period
    @period = Period(params[:id])
    @homework = Homework.new
  end
end