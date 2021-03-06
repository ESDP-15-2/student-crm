class SmsDeliveriesController < ApplicationController

  add_breadcrumb 'Рассылки', :sms_deliveries_url

  def index
    @sms_deliveries = SmsDelivery.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
  end

  def show
    @sms_delivery = SmsDelivery.find(params[:id])
    add_breadcrumb @sms_delivery.title, :sms_delivery_url
  end

  def resend_message
    @sms_delivery = SmsDelivery.find(params[:id])
    @sms_delivery = SmsDelivery.new(@sms_delivery.attributes)
    render :new
  end

  def new
    @sms_delivery = SmsDelivery.new
    add_breadcrumb 'Новая рассылка', :new_sms_delivery_url
  end

  def new_from_contact_list
    @sms_delivery = SmsDelivery.new
    @contact_list = ContactList.find(params[:id])
    add_breadcrumb 'Новая рассылка'
  end

  def create
    @sms_delivery = SmsDelivery.new(sms_delivery_params)
    @sms_delivery.delivery_time = Time.now + 3.minutes
    @sms_delivery.title = 'Умная Рассылка' if @sms_delivery.smart_delivery
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
    add_breadcrumb 'Редактирование рассылки - ' + @sms_delivery.title
  end

  def update
    @sms_delivery = SmsDelivery.find(params[:id])
    if @sms_delivery.update(sms_delivery_params)
      @sms_delivery.update_attribute(:delivery_time, Time.now + 3.minutes)
      redirect_to sms_deliveries_url
      flash[:success] = 'Сообщение успешно отредактировано'
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
    @sms = SmsDelivery.find(params[:id])
    @sms.send_message
    redirect_to sms_deliveries_url
    flash[:success] = 'Сообщение Отправлено'
  end

  private

  def sms_delivery_params
    params.require(:sms_delivery).permit(:title, :content, :contact_list_id, :sender_id, :smart_delivery)
  end

end