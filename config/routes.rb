Rails.application.routes.draw do
  post 'sms_deliveries/:id/send' => 'sms_deliveries#send_message', as: 'sms_send_message'

  root 'sms_deliveries#root'

  resources :contact_lists, :sms_deliveries, :students
end
