# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def log_in(user)
    return if user.nil?

    session[:user_id] = user.id
  end

  def current_user
    session[:user_id].nil? ? nil : User.includes(:attended_events, :created_events).find(session[:user_id])
  end

  def logged_in?
    !session[:user_id].nil? && User.exists?(id: session[:user_id])
  end

  def logged_in
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to signin_url
  end
end
