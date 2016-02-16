set :environment, 'development'
set :output, {:error => "log/cron_error.log", :standard => "log/cron.log"}

every 1.minutes do
  rake 'sms:send'
end

