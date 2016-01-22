Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'users#profile', as: :authenticated_root
    end

    unauthenticated do
      root 'pages#home', as: :unauthenticated_root
    end
  end


  get 'users/:id/profile' => 'users#profile', as: 'user_profile'
  get 'users/students' => 'users#students', as: 'students'
  get 'users/:id/show' => 'users#show', as: 'show_user'


  resources :users,
            :contact_lists,
            :sms_deliveries,
            :sms_service_accounts,
            :senders,
            :course_elements,
            :courses,
            :groups

  resources :custom_lists do
    collection {post :import}
  end


  post 'sms_deliveries/:id/send' => 'sms_deliveries#send_message', as: 'sms_send_message'
  get 'select_objects/select_group/:id' => 'select_objects#select_group', as: 'select_groups'
  get 'select_objects/select_students/:id' => 'select_objects#select_students', as: 'select_students'
  get 'sms_deliveries/new_from_contact_list/:id' => 'sms_deliveries#new_from_contact_list', as: 'sms_new_from_contact_list'
  get 'sms_deliveries/resend_message/:id' => 'sms_deliveries#resend_message', as: 'sms_resend'

end
