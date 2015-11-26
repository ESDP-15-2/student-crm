Rails.application.routes.draw do
  root 'sms_deliveries#index'

  resources :students
  resources :contact_lists
  resources :sms_deliveries
  resources :sms_service_accounts

  post 'sms_deliveries/:id/send' => 'sms_deliveries#send_message', as: 'sms_send_message'

  get 'select_objects/select_group/:id' => 'select_objects#select_group', as: 'select_groups'
  get 'select_objects/select_students/:id' => 'select_objects#select_students', as: 'select_students'
end
