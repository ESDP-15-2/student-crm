class UsersController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb 'Пользователи', :users_url

 def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def students
    add_breadcrumb 'Студенты', :students_url

    student = Role.find_by(name: 'student')
    @students = student.users.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if user.save
      flash[:success] = 'Пользователь успешно создан'
      redirect_to users_url
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_url
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
    params.require(:user).permit(:name, :surname, :birthdate, :gender, :passport_data, :email, :password,
                                 contact_attributes: [:phone, :additional_phone, :skype], :role_ids => [])
  end
end
