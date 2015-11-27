class SendersController < ApplicationController
  def index
    @senders = Sender.all
  end

  def show
    @sender = Sender.find(params[:id])
  end

  def new
    @sender = Sender.new
  end

  def create
    @sender = Sender.new(sender_params)
    if @sender.save
      redirect_to senders_url
      flash[:success] = 'Отправитель успешно создан'
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'new'
    end
  end

  def edit
    @sender = Sender.find(params[:id])
  end

  def update
    @sender = Sender.find(params[:id])

    if @sender.update(sender_params)
      flash[:success] = 'Отправитель был успешно обновлен'
      redirect_to senders_url
    else
      flash[:danger] = 'Вы ввели некорректные данные, проверьте и попробуйте снова'
      render 'edit'
    end
  end

  def destroy
    @sender.destroy
    flash[:success] = 'Отправитель был успешно удален'
    redirect_to senders_url
  end

  private

  def sender_params
    params.require(:sender).permit(:name, :sms_service_account_id)
  end
end
