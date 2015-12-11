class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  add_breadcrumb 'Home', :root_url

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :surname, :gender, :birthdate,
                                                            :passport_data, :email, :password, :password_confirmation,
                                                            contact_attributes:[:phone, :additional_phone, :skype]) }

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :surname, :gender, :birthdate,
                                                            :passport_data, :email, :password, :password_confirmation,
                                                            contact_attributes:[:phone, :additional_phone, :skype]) }
  end
end