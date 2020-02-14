# frozen_string_literal: true

# Controller for login,logout...
class SessionsController < ApplicationController
  # get my user data.
  def index
    @user = User.find_by(id: session[:user_id])
    if @user
      render json: {
        id: @user.id,
        user_name: @user.user_name,
        image_url: @user.image_url,
        email: @user.email,
        created_at: @user.created_at,
        updated_at: @user.updated_at,
        scope: @user.privileges
      }
      @user
    else
      render json: false
    end
  end

  # show login form
  # This is very simple page but important to avoid CSFR attack.
  # We can set CSRF token easyly by showing this page on rails.
  def new; end

  def create
    @user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    if @user
      session[:user_id] = @user.id
      set_csrf_cookie
      redirect_to redirect_url
    else
      render json: { message: 'failed to login' }, status: 500
    end
  end

  def destroy
    reset_session
    unset_csrf_cookie
    render json: { message: 'success' }
  end

  private

  def redirect_url
    if cookies['auth.redirect'].present?
      CGI.unescape(cookies['auth.redirect'])
    else
      root_path
    end
  end

  def set_csrf_cookie
    cookies['x-csrf-token'] = form_authenticity_token if protect_against_forgery?
  end

  def unset_csrf_cookie
    cookies.delete('x-csrf-token')
  end
end
