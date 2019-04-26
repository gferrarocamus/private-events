class EventsController < ApplicationController
  def index
  end
  
  def show
  end

  def new
    @user = current_user
    @event = Event.new
  end

  def create
    @event = Event.new
  end

  private

  def user_params
    params.require(:event).permit(:name, :date, :location, :description)
  end
end