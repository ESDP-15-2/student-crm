class StudentOfficesController < ApplicationController
  def all_periods
    @periods = Period.all
    @homeworks = Homework.all
  end

  def show_one_period
    @period = Period(params[:id])
    @homework = Homework.new
  end
end
