Rails.application.routes.draw do
  root 'sms_deliveries#root'

  resources :contact_lists, :sms_deliveries, :students
end
