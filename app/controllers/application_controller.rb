class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :nickname
    devise_parameter_sanitizer.for(:sign_up) << :school_id
    devise_parameter_sanitizer.for(:sign_up) << :department_id
    devise_parameter_sanitizer.for(:sign_up) << :graduate_year
    devise_parameter_sanitizer.for(:sign_up) << {
      wish_universities_attributes: [:id, :university_id, :department_id]
    }
  end
end
