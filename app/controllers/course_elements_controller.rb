class CourseElementsController < ApplicationController

  add_breadcrumb 'Учебные блоки', :course_elements_url

  def index
    @course_elements = CourseElement.all
  end

  def show
    @course_element = CourseElement.find(params[:id])
  end

  def new
    @course_element = CourseElement.new
    add_breadcrumb 'Новый учебный блок', :new_course_element_url
  end

  def create
    @course_element = CourseElement.new(course_elements_params)

    if @course_element.save
      flash[:success] = 'Учебный блок успешно создан'
      redirect_to course_elements_url
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'new'
    end
  end

  def edit
    @course_element = CourseElement.find(params[:id])
    add_breadcrumb 'Редактирование учебного блока - ' + @course_element.theme
  end

  def update
    @course_element = CourseElement.find(params[:id])

    if @course_element.update(course_elements_params)
      redirect_to course_elements_url
      flash[:success] = 'Учебный блок успешно обновлен'
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'edit'
    end
  end

  def destroy
    @course_element = CourseElement.find(params[:id])

    @course_element.destroy
    flash[:success] = 'Учебный блок успешно удален'
    redirect_to course_elements_url
  end


  private

  def course_elements_params
    params.require(:course_element).permit(:theme, :element_type)
  end

end
