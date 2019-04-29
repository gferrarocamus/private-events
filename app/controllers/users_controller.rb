# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:info] = 'Welcome!'
      redirect_to profile_url
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @previous_events = @user.attended_events.where('date < ?', Time.now.in_time_zone)
    @upcoming_events = @user.attended_events.where('date > ?', Time.now.in_time_zone)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
