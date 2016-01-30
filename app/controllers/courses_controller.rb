class CoursesController < ApplicationController
  add_breadcrumb 'Курсы', :courses_url

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])

		add_breadcrumb @course.name
  end

  def new
    @course = Course.new
    add_breadcrumb 'Новый курс', :new_course_url
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = 'Курс успешно создан'
      redirect_to course_url(@course)
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
    add_breadcrumb 'Редактирование курса - ' + @course.name
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:success] = 'Курс успешно обновлен'
      redirect_to course_url(@course)
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:success] = 'Курс успешно удален'

    redirect_to courses_url
  end

  private

  def course_params
    params.require(:course).permit(:name, :starts_at, :ends_at)
  end
end
