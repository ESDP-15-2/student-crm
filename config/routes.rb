Rails.application.routes.draw do

  resources :students
  resources :contact_lists
  resources :sms_deliveries
  post 'sms_deliveries/:id/send' => 'sms_deliveries#send_message', as: 'sms_send_message'
end
