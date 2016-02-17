class UsersController < ApplicationController
  #load_and_authorize_resource

  before_action :authenticate_user!
  add_breadcrumb '<i class="fa fa-home"></i> Главная'.html_safe, :authenticated_root_url

  def show
    @user = User.find(params[:id])
    add_breadcrumb 'Пользователи', :users_url
    add_breadcrumb @user.full_name, :user_url
  end

  def show_current_user
    @user = current_user
    #add_breadcrumb 'Мой профиль', :authenticated_root_url
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
    add_breadcrumb 'Пользователи', :users_url
  end

  def admins
    @admins = Role.find_by(name: 'Администратор').users.paginate(page: params[:page], per_page: 10)
    add_breadcrumb 'Пользователи', :users_url
    add_breadcrumb 'Администраторы', :admins_url
  end

  def full_authority_users
    @full_authority_users = Role.find_by(name: 'Пользователь с полным доступом').users.paginate(page: params[:page], per_page: 10)
    add_breadcrumb 'Пользователи', :users_url
    add_breadcrumb 'Пользователи с полным доступом', :full_authority_users_url
  end

  def students
    @students = Role.find_by(name: 'Студент').users.paginate(page: params[:page], per_page: 10)
    add_breadcrumb 'Пользователи', :users_url
    add_breadcrumb 'Студенты', :students_url
  end

  def instructors
    @instructors = Role.find_by(name: 'Преподаватель').users.paginate(page: params[:page], per_page: 10)
    add_breadcrumb 'Пользователи', :users_url
    add_breadcrumb 'Преподаватели', :instructors_url
  end

  def new
    @user = User.new
    add_breadcrumb 'Пользователи', :users_url
    add_breadcrumb 'Новый пользователь', :new_user_url
  end

  def create
    @user = User.new(user_params)
    add_roles(@user)

    if @user.save
      @user.send_reset_password_instructions
      flash[:success] = 'Пользователь успешно создан'
      redirect_to @user
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    add_breadcrumb 'Пользователи', :users_url
    add_breadcrumb @user.full_name, :user_url
    add_breadcrumb 'Редактирование профиля', :edit_user_url
  end

  def edit_current_user
    @user = current_user
    #add_breadcrumb 'Мой профиль', :authenticated_root_url
    add_breadcrumb 'Редактирование профиля', :edit_current_user_url
  end

  def update
    @user = User.find(params[:id])
    if @user.has_role? 'Администратор'
      add_roles(@user)
    end

    if @user.update(user_params)
      redirect_to @user
      flash[:success] = 'Данные пользователя успешно обновлены'
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    flash[:success] = 'Пользователь успешно удален'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :birthdate, :gender, :passport_data, :photo, :passport_scan_copy,
                                 :email, :password, group_ids: [], role_ids: [],
                                 contact_attributes: [:id, :phone, :additional_phone, :skype])
  end

  def add_roles(user)
    user.roles = []
    params[:user][:role_ids].each do |r|
      user.roles.push(Role.find(r)) unless r.blank?
    end
  end
end
