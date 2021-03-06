class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :resolve_layout

  before_action :authenticate_user!

  private

  def resolve_layout
    if devise_controller? && resource_name == :user #&& action_name == 'new' or 'edit'
      'sign_in'
    else
      'application'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u| u.permit(:name,
                                                             :surname,
                                                             :gender,
                                                             :birthdate,
                                                             :passport_data,
                                                             :email,
                                                             :password,
                                                             :password_confirmation,
                                                             contact_attributes:[:phone,
                                                                                 :additional_phone,
                                                                                 :skype])
    end

    devise_parameter_sanitizer.for(:account_update) do |u| u.permit(:name,
                                                                   :surname,
                                                                   :gender,
                                                                   :birthdate,
                                                                   :passport_data,
                                                                   :email,
                                                                   :password,
                                                                   :password_confirmation,
                                                                   :current_password,
                                                                   contact_attributes:[:phone,
                                                                                       :additional_phone,
                                                                                       :skype])
    end
  end

  def after_sign_in_path_for(resource)
    authenticated_root_path
  end
end