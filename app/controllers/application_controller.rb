# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  include EventsHelper

  def logged_in
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to signin_url
  end
end
