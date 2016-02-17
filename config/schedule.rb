set :environment, 'production'
set :output, {:error => "log/cron_error.log", :standard => "log/cron.log"}

every 1.minutes do
  rake 'sms:send'
end

every 1.day, :at => '04:11pm' do
  rake 'sms:smart'
end