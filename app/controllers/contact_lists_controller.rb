class ContactListsController < ApplicationController

  add_breadcrumb '<i class="fa fa-home"></i> Главная'.html_safe, :authenticated_root_url
  add_breadcrumb 'Листы получателей', :contact_lists_url

  def index
    @contact_lists = ContactList.paginate(page: params[:page], per_page: 10)
  end

  def show
    @contact_list = ContactList.find(params[:id])
    add_breadcrumb @contact_list.title, :contact_list_url
  end

  def new
    @contact_list = ContactList.new
    add_breadcrumb 'Новый лист получателей', :new_contact_list_url
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
    add_breadcrumb @contact_list.title, :contact_list_url
    add_breadcrumb 'Редактирование', :edit_contact_list_url
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
    params.require(:contact_list).permit(:title, user_ids: [])
  end
end
