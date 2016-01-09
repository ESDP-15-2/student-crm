class CourseElementsController < ApplicationController

  add_breadcrumb 'Учебные программы', :course_elements_url

  def index
    @course_elements = CourseElement.all
  end

  def show
    @course_element = CourseElement.find(params[:id])
  end

  def new
    @course_element = CourseElement.new
  end

  def create
    @course_element = CourseElement.new(course_elements_params)

    if @course_element.save
      flash[:success] = 'Учебная программа успешно создана'
      redirect_to course_elements_url
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'new'
    end
  end

  def edit
    @course_element = CourseElement.find(params[:id])
  end

  def update
    @course_element = CourseElement.find(params[:id])

    if @course_element.update(course_elements_params)
      redirect_to course_elements_url
      flash[:success] = 'Данные учебной программы успешно обновлены'
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'edit'
    end
  end

  def destroy
    @course_element = CourseElement.find(params[:id])

    @course_element.destroy
    flash[:success] = 'Учебная программа успешно удалена'
    redirect_to course_elements_url
  end


  private

  def course_elements_params
    params.require(:course_element).permit(:theme, :element_type, :date_for_theme, :home_work, :date_for_hw)
  end

end
