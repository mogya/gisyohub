# frozen_string_literal: true

# application base controller.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate
  after_action :set_csrf_token_header

  private

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by(uid: session[:user_id])
  end

  def logged_in?
    session[:user_id].present?
  end

  def authenticate
    return if logged_in?

    redirect_to root_path, alert: 'ログインしてください'
  end

  def set_csrf_token_header
    response.set_header('X-CSRF-Token', form_authenticity_token)
  end
end
