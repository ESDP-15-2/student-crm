class SmsDeliveriesController < ApplicationController

  def index
    @sms_deliveries = SmsDelivery.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def show
    @sms_delivery = SmsDelivery.find(params[:id])
  end

  def new
    @sms_delivery = SmsDelivery.new
  end

  def new_from_contact_list
    @sms_delivery = SmsDelivery.new
    @contact_list = ContactList.find(params[:id])
  end

  def create
    @sms_delivery = SmsDelivery.new(sms_delivery_params)
    if @sms_delivery.save
      @sms_delivery.update_attribute(:delivery_time, Time.now + 3.minutes)
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
      @sms_delivery.update_attribute(:delivery_time, @sms_delivery.updated_at + 3.minutes)
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
  end

  private

  def sms_delivery_params
    params.require(:sms_delivery).permit(:title, :content, :contact_list_id, :sender_id)
  end

  def set_url (url, message)
    http = Net::HTTP.new('smspro.nikita.kg')
    http.post(url, message.to_xml)
  end

  def parse_report(xml)
    xml_doc = Nokogiri::XML(xml.body)
    xml_doc.remove_namespaces!
    doc = xml_doc.xpath('//phone')
    hash = {}
    doc.each do |phone|
      hash[phone.xpath('number').text] = phone.xpath('report').text
    end
    hash
  end

end