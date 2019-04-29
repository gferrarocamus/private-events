# frozen_string_literal: true

class SessionsController < ApplicationController
  # before_action logged_in_user, only: [:destroy]

  def new; end

  def create
    @user = User.find_by(session_params)
    log_in @user
    flash[:success] = 'You are now logged in'
    redirect_to profile_url
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:name)
  end
end
