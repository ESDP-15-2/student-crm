class SmsDeliveriesController < ApplicationController

  def index
  end

  def new
    @sms_delivery = SmsDelivery.new
  end

  def create
    @sms_delivery = SmsDelivery.new(sms_delivery_params)
    if @sms_delivery.save
      flash[:success] = 'СМС рассылка будет отправлена через 3 минуты'
      redirect_to sms_deliveries_url
    else
      flash[:danger] = 'Вы ввели некоректные данные, проверьте и попробуйте снова'
      render new_sms_delivery_path
    end
  end

  private

  def sms_delivery_params
    params.require(:sms_delivery).permit(:title, :author, :content, :contact_list_id)
  end

end
