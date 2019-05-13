# frozen_string_literal: true

# UsersController
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
      redirect_to @user
    else
      flash[:danger] = 'Name can\'t be blank'
      render 'new'
    end
  end

  def show
    if (@user = User.find_by(id: params[:id]))
      @attended_past_events = @user.previous_events('attended')
      @attended_upcoming_events = @user.upcoming_events('attended')
      @created_past_events = @user.previous_events('created')
      @created_upcoming_events = @user.upcoming_events('created')
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
