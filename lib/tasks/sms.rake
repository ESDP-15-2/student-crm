namespace :sms do
  desc 'Rake task to send sms message'

  task :send => :environment do
    SmsDelivery.where(status:false).each do |message|

      if message.delivery_time <= Time.now
        message.send_message
      end

    end
  end

end