class SmsServiceAccountsController < ApplicationController
  before_action :set_sms_service_account, only: [:show, :edit, :update, :destroy]

  add_breadcrumb 'Учетные записи', :sms_service_accounts_url

  def index
    @sms_service_accounts = SmsServiceAccount.all
    @senders = Sender.all
  end

  def show
    add_breadcrumb @sms_service_account.login, :sms_service_account_url
  end

  def new
    @sms_service_account = SmsServiceAccount.new
    @sms_service_account.senders.build
    add_breadcrumb 'Новая учетная запись'
  end

  def create
    @sms_service_account = SmsServiceAccount.new(sms_service_account_params)
    if @sms_service_account.save
      redirect_to sms_service_accounts_url
      flash[:success] = 'Учетная запись успешно создана'
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'new'
    end
  end

  def edit
    @sms_service_account.senders.build
    add_breadcrumb 'Редактирование учетной записи - ' + @sms_service_account.login
  end

  def update
    if @sms_service_account.update(sms_service_account_params)
      flash[:success] = 'Учетная запись успешно обновлена'
      redirect_to sms_service_accounts_url
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'edit'
    end
  end

  def destroy
    @sms_service_account.destroy
    flash[:success] = 'Учетная запись успешно удалена'
    redirect_to sms_service_accounts_url
  end

  private

  def set_sms_service_account
    @sms_service_account = SmsServiceAccount.find(params[:id])
  end

  def sms_service_account_params
    params.require(:sms_service_account).permit(:login, :password, senders_attributes: [:id, :name, :sms_service_account])
  end
end