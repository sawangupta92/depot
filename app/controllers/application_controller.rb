class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
  # before_action :authorize
  # protected
  # def authorize
  #   unless User.find_by(id: session[:user_id])
  #     redirect_to login_url, notice: "Please log in"
  #   end
  # end
end
