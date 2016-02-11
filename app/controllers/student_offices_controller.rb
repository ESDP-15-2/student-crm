class StudentOfficesController < ApplicationController
  def all_periods
    @periods = Period.all
    @homeworks = Homework.all
    @user_hws = current_user_homeworks

  end

  def current_user_homeworks
    @user_hws = []
    @homeworks.each do |hw|
     if hw.user == current_user
       @user_hws.push hw
     end
    end
    return @user_hws
  end

  def show_one_period
    @period = Period(params[:id])
    @homework = Homework.new
  end
end
