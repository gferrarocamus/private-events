class ApplicationController < ActionController::Base
  include SessionsHelper

  def logged_in
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to signin_url
    end
  end
end
