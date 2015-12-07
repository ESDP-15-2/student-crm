class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  scheduler = Rufus::Scheduler.new

  scheduler.every '10s' do
    SmsDelivery.all.each do |message|
      unless message.status
        if message.delivery_time <= Time.now
          message.send_message
        end
      end
    end
  end
end