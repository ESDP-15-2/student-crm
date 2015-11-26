class SelectObjectsController < ApplicationController
  def select_group
    @course = Course.find(params[:id])
    @groups = @course.groups
    render json: @groups
  end

  def select_students
    @group = Group.find(params[:id])
    @students = @group.students
    render json: @students
  end
end
