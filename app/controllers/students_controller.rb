class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      flash[:success] = 'Данные успешно обновлены'
      redirect_to student_url
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:success] = 'Данные студента удалены'

    redirect_to contact_lists_url
  end

  private

  def student_params
    params.require(:student).permit(:name, :phone, :email, :group_ids[])
  end

end
