class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_person!
  before_action :set_accounts

  include PivotalApiHelper

  protected

  def set_accounts
    @accounts = Account.all
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |u|
      u.permit(:username,
               :password,
               :remember_me)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
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
