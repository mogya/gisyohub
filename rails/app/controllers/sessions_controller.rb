# frozen_string_literal: true

# Controller for login,logout...
class SessionsController < ApplicationController
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
    flash[:notice] = 'ログアウトしました。'
    redirect_to root_path
  end
end
