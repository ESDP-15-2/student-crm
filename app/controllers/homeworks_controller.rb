class HomeworksController < ApplicationController
  def new
    @homework = Homework.new
  end

  def create
    @homework = Homework.new(homework_params)
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

  def homework_params
    params.require(:homework).permit( :rating, :review, :hw_archive, :period_id, :user_id)
  end
end
