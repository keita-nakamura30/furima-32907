class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_firstname, :name_lastname,:name_firstname_kana,:name_lastname_kana,:birth_day,:nickname])
  end
end
