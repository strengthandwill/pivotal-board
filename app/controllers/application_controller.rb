class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_person!
  before_action :set_accounts

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include PivotalApiHelper

  protected

  def set_accounts
    @accounts = Account.all
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:username,
               :password,
               :remember_me)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username,
               :name,
               :email,
               :password,
               :password_confirmation,
               :current_password,
               :image_path)
    end
  end

  private

  def settings
    Setting.last
  end
end
