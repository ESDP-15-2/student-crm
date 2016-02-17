namespace :sms do
  desc 'Rake task to send sms message'

  task :send => :environment do
    SmsDelivery.where(status:false).each do |message|

      if message.delivery_time <= Time.now
        message.send_message
      end

    end
  end

  task :smart => :environment do

    today = DateTime.now.strftime('%B %d, %Y')

    smart_message = SmsDelivery.where(smart_delivery: true).first
    new_message = smart_message.dup
    new_message.update_attribute(:smart_delivery, false)
    Period.all.each do |period|
      if today == period.commence_datetime.strftime('%B %d, %Y')
        puts 'i made it to IF, i am good'
        new_message.content = smart_message.content % {course: period.course.name,  group: period.group.name}
        new_message.send_message
      end
      puts 'I am not working.'
    end
  end

end