# frozen_string_literal: true

# SessionsController
class SessionsController < ApplicationController
  def new; end

  def create
    if (@user = User.find_by(session_params))
      log_in @user
      flash[:success] = 'You are now logged in'
      redirect_to root_path
    else
      flash[:warning] = 'Enter a valid username'
      render 'new'
    end
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
