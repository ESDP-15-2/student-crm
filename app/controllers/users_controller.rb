class UsersController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb 'Пользователи', :users_url

  def show
    @user = User.find(params[:id])
    add_breadcrumb 'Просмотр профиля пользователя', :user_url
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def students
    add_breadcrumb 'Студенты', :students_url

    student = Role.find_by(name: 'Студент')
    @students = student.users.paginate(page: params[:page], per_page: 10)
  end

  def new
    add_breadcrumb 'Создание пользователя', :new_user_url
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    add_roles(@user)

    if @user.save
      flash[:success] = 'Пользователь успешно создан'
      redirect_to @user
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'new'
    end
  end

  def edit
    add_breadcrumb 'Редактирование данных пользователя', :edit_user_url
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    add_roles(@user)

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
