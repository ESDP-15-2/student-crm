class ContactListsController < ApplicationController

  add_breadcrumb 'Листы Получателей', :contact_lists_url
  def index
    @contact_lists = ContactList.all
  end

  def show
    @contact_list = ContactList.find(params[:id])
    add_breadcrumb @contact_list.title, :contact_list_url
  end

  def new
    @contact_list = ContactList.new
    add_breadcrumb 'Новый Лист', :new_contact_list_url
  end

  def create
    @contact_list = ContactList.new(contact_list_params)
    if @contact_list.save
      redirect_to contact_lists_url
      flash[:success] = 'Список получателей успешно создан'
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'new'
    end
  end

  def edit
    @contact_list = ContactList.find(params[:id])
    add_breadcrumb 'Редактировать'
  end

  def update
    @contact_list = ContactList.find(params[:id])

    if @contact_list.update(contact_list_params)
      flash[:success] = 'Список получателей успешно обновлен'
      redirect_to contact_lists_url
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'edit'
    end
  end

  def destroy
    @contact_list = ContactList.find(params[:id])
    @contact_list.destroy
    flash[:success] = 'Список получателей удален'

    redirect_to contact_lists_url
  end

  private

  def contact_list_params
    params.require(:contact_list).permit(:title, student_ids: [])
  end
end
