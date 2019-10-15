# frozen_string_literal: true

# Controller for login,logout...
class SessionsController < ApplicationController
  # show login form
  # This is very simple page but important to avoid CSFR attack.
  # We can set CSRF token easyly by showing this page on rails.
  def new; end

  def create
    @user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    if @user
      session[:user_id] = @user.id
      render json: @user, status: :ok
    else
      render json: { message: 'failed to login' }, status: 500
    end
  end

  def destroy
    reset_session
    render json: { message: 'success' }
  end
end
