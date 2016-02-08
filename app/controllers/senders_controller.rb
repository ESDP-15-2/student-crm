class SendersController < ApplicationController

  add_breadcrumb '<i class="fa fa-home"></i> Главная'.html_safe, :authenticated_root_url
  add_breadcrumb 'Учетные записи', :sms_service_accounts_url

  def new
    @sender = Sender.new
    add_breadcrumb 'Новый отравитель', :new_sender_url
  end

  def create
    @sender = Sender.new(sender_params)
    if @sender.save
      redirect_to sms_service_accounts_url
      flash[:success] = 'Отправитель успешно создан'
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'new'
    end
  end

  private

  def sender_params
    params.require(:sender).permit(:name, :sms_service_account_id)
  end
end
