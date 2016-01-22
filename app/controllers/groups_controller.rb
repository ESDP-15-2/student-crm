class GroupsController < ApplicationController
  def index
    @groups = Group.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = 'Группа успешно создана'
      redirect_to groups_url
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_url
      flash[:success] = 'Группа успешно отредактирована'
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'edit'
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:success] = 'Группа успешно удалена'
    redirect_to groups_url
  end

  private
  def group_params
    params.require(:group).permit(:name, :course_id)
  end
end
