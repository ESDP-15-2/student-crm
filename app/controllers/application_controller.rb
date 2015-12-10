class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  add_breadcrumb 'Home', :root_url

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name

    devise_parameter_sanitizer.for(:sign_up) << :surname
    devise_parameter_sanitizer.for(:account_update) << :surname

    devise_parameter_sanitizer.for(:sign_up) << :gender
    devise_parameter_sanitizer.for(:account_update) << :gender

    devise_parameter_sanitizer.for(:sign_up) << :birthdate
    devise_parameter_sanitizer.for(:account_update) << :birthdate

    devise_parameter_sanitizer.for(:sign_up) << :passport_data
    devise_parameter_sanitizer.for(:account_update) << :passport_data

    devise_parameter_sanitizer.for(:sign_up) << :phone
    devise_parameter_sanitizer.for(:account_update) << :phone

    devise_parameter_sanitizer.for(:sign_up) << :additional_phone
    devise_parameter_sanitizer.for(:account_update) << :additional_phone

    devise_parameter_sanitizer.for(:sign_up) << :skype
    devise_parameter_sanitizer.for(:account_update) << :skype
  end
end