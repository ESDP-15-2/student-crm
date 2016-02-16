class AcademicUnitsController < ApplicationController

  def all_courses
    @courses = Course.all
  end

  def get_group_academic_unit
    @course = Course.find(params[:id])
    @groups = Group.where(course: @course)
  end

  def index
    group = Group.find(params[:id])
    @academic_units = AcademicUnit.where()
  end
  def new
    @academic_unit = AcademicUnit.new
  end
  def create
    @academic_unit = AcademicUnit.new(academic_unit_params)
    if @academic_unit.save
      redirect_to academic_units_url
    else
      render new
    end
  end

  def show
    @academic_unit = AcademicUnit.find(params[:id])
    @periods = Period.where(academic_unit_id: @academic_unit.id)
  end

  def edit
    @academic_unit = AcademicUnit.find(params[:id])
  end

  def update
    def update
      @academic_unit = AcademicUnit.find(params[:id])

      if @academic_unit.update(academic_unit_params)
        flash[:success] = 'Учебный модульобновлен'
        redirect_to academic_units_url
      else
        flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
        render 'edit'
      end
    end
  end

  private
  def academic_unit_params
    params.require(:academic_unit).permit(:title, :starts_at, :ends_at,  period_ids: [])
  end
end
