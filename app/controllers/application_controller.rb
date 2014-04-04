class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| devise_permit_params(u) }
    devise_parameter_sanitizer.for(:account_update) { |u| devise_permit_params(u) }
  end

  private

  def devise_permit_params(u)
    u.permit(
      :first_name, :last_name,
      :nickname,
      :school, :department,
      :graduate_year,
      wish_universities_attributes: [:id, :university_id, :department_id]
    )
  end
end
