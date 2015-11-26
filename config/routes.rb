Rails.application.routes.draw do
  root 'sms_deliveries#index'

  resources :students
  resources :contact_lists
  resources :sms_deliveries
  resources :sms_service_accounts

  post 'sms_deliveries/:id/send' => 'sms_deliveries#send_message', as: 'sms_send_message'
end
