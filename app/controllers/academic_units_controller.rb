class AcademicUnitsController < ApplicationController
  def index
    @academic_units = AcademicUnit.all
  end
  def new
    @academic_unit = AcademicUnit.new
  end
  def create
    @academic_unit = AcademicUnit.new(academic_umit_params)
    if @academic_unit.save
      redirect_to academic_units_url
    else
      render new
    end
  end
  def show
    @academic_unit = AcademicUnit.find(params[:id])
  end
  

  private
  def academic_umit_params
    params.require(:academic_unit).permit(:title, :starts_at, :ends_at,  period_ids: [])
  end
end
