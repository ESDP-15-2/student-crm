ActionMailer::Base.smtp_settings = {
    :address => 'smtp.gmail.com',
    :port => 587,
    :domain => 'gmail.com',
    :enable_starttls_auto => true,
    :user_name => ENV["GMAIL_USERNAME"],
    :password => ENV["GMAIL_PASSWORD"],
    :authentication => :plain
}