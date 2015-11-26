class SmsDeliveriesController < ApplicationController

  def index
    @sms_deliveries = SmsDelivery.order(created_at: :desc)
  end

    def show
      @sms_delivery = SmsDelivery.find(params[:id])
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
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'new'
    end
  end

  def edit
    @sms_delivery = SmsDelivery.find(params[:id])
  end

  def update
    @sms_delivery = SmsDelivery.find(params[:id])
    if @sms_delivery.update(sms_delivery_params)
      redirect_to sms_deliveries_url
      flash[:success] = 'Сообщение успешно отредактированно'
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'edit'
    end
  end

  def destroy
    @sms_delivery = SmsDelivery.find(params[:id])
    @sms_delivery.destroy
    flash[:success] = 'Сообщение успешно удалено'
    redirect_to sms_deliveries_url
  end

  def send_message
    @sms_delivery = SmsDelivery.find(params[:id])
    http = Net::HTTP.new("smspro.nikita.kg")
    @response = http.post("/api/message", @sms_delivery.to_xml)
    flash[:success] = 'Сообщение успешно отправленно'
    redirect_to sms_deliveries_url
  end

  private

  def sms_delivery_params
    params.require(:sms_delivery).permit(:title, :content, :contact_list_id, :sender_id)
  end

end
