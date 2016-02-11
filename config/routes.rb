Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'users#show_current_user', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users
  get 'users/students' => 'users#students', as: 'students'
  get 'users/:id/show_current_user' => 'users#show_current_user', as: 'show_current_user'
  get 'users/:id/edit_current_user' => 'users#edit_current_user', as: 'edit_current_user'
  get 'users/:id/show' => 'users#show', as: 'show_user'

  resources :periods do
    resources :homeworks
  end

  resources :course_elements,
            :courses,
            :groups,
						:periods,
            :homeworks

  resources :sms_deliveries,
            :contact_lists,
            :sms_service_accounts,
            :senders

  get 'student_offices/all_periods/' => 'student_offices#all_periods', as: 'all_periods'
  get 'homeworks/rate_homework/:id' => 'homeworks#rate_homework', as: 'rate_homework'
  get 'homeworks/create_hw_with_period/:id' => 'homeworks#create_hw_with_period', as: 'create_hw_with_period'
  get 'sms_deliveries/new_from_contact_list/:id' => 'sms_deliveries#new_from_contact_list', as: 'sms_new_from_contact_list'
  get 'sms_deliveries/resend_message/:id' => 'sms_deliveries#resend_message', as: 'sms_resend'
  post 'sms_deliveries/:id/send' => 'sms_deliveries#send_message', as: 'sms_send_message'

  resources :custom_lists do
    collection {post :import}
  end

  get 'select_objects/select_group/:id' => 'select_objects#select_group', as: 'select_groups'
  get 'select_objects/select_students/:id' => 'select_objects#select_students', as: 'select_students'

	get '/calendar' => 'periods#calendar', as: 'calendar'
	get '/calendar/subjects_by_course' => 'periods#get_subjects_by_course_id', as: 'get_subject_by_course'
end
