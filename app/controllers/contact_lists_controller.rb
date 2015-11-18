class ContactListsController < ApplicationController
  def index
    @contact_lists = ContactList.all
  end

  def show
    @contact_list = ContactList.find(params[:id])
  end

  def new
    @contact_list = ContactList.new
  end

  def create
    @contact_list = ContactList.new(contact_list_params)
    if @contact_list.save
      redirect_to contact_lists_url
      flash[:success] = 'Список получателей успешно создан'
    else
      render 'new'
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
