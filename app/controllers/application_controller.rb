# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    session[:user_id].nil? ? nil : User.find(session[:user_id])
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def logged_in
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to signin_url
  end

  def user_attending
    @event.event_attendees.exists?(current_user.id)
  end
end
