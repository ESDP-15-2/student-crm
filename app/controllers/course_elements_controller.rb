class CourseElementsController < ApplicationController

  add_breadcrumb '<i class="fa fa-home"></i> Главная'.html_safe, :authenticated_root_url
  add_breadcrumb 'План курса', :course_elements_url

  def index
    @course_elements = CourseElement.paginate(page: params[:page], per_page: 10)
  end

  def show
    @course_element = CourseElement.find(params[:id])
    add_breadcrumb @course_element.theme, :course_element_url
  end

  def new
    @course_element = CourseElement.new
    add_breadcrumb 'Новый учебный материал', :new_course_element_url
  end

  def create
    @course_element = CourseElement.new(course_elements_params)

    if @course_element.save
      flash[:success] = 'Учебный материал успешно создан'
      redirect_to course_elements_url
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'new'
    end
  end

  def edit
    @course_element = CourseElement.find(params[:id])
    add_breadcrumb @course_element.theme, :course_element_url
    add_breadcrumb 'Редактирование', :edit_course_element_url
  end

  def update
    @course_element = CourseElement.find(params[:id])

    if @course_element.update(course_elements_params)
      redirect_to course_elements_url
      flash[:success] = 'Учебный материал успешно обновлен'
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'edit'
    end
  end

  def destroy
    @course_element = CourseElement.find(params[:id])

    @course_element.destroy
    flash[:success] = 'Учебный материал успешно удален'
    redirect_to course_elements_url
  end


  private

  def course_elements_params
    params.require(:course_element).permit(:theme, :element_type, :course_id)
  end

end
