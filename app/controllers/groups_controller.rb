class GroupsController < ApplicationController

  add_breadcrumb '<i class="fa fa-home"></i> Главная'.html_safe, :authenticated_root_url
  add_breadcrumb 'Группы', :groups_url

  def index
    @groups = Group.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def new
    @group = Group.new
    @students = Role.find_by(name: 'Студент').users
    add_breadcrumb 'Новая группа', :new_group_url
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      ContactList.create(title: @group.name)
      flash[:success] = 'Группа успешно создана'
      redirect_to groups_url
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
    @students = Role.find_by(name: 'Студент').users
    add_breadcrumb @group.name, :group_url
    add_breadcrumb 'Редактирование', :edit_group_url
  end

  def update
    @group = Group.find(params[:id])
    contact_list = ContactList.find_by(title:@group.name)
    if @group.update(group_params)
      contact_list.update(title: @group.name)
      redirect_to groups_url
      flash[:success] = 'Группа успешно отредактирована'
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'edit'
    end
  end

  def show
    @group = Group.find(params[:id])
    add_breadcrumb @group.name, :group_url
  end

  def destroy
    @group = Group.find(params[:id])
    contact_list = ContactList.find_by(title:@group.name)
    @group.destroy
    contact_list.destroy
    flash[:success] = 'Группа успешно удалена'
    redirect_to groups_url
  end

  private
  def group_params
    params.require(:group).permit(:name, :course_id, user_ids: [])
  end
end
