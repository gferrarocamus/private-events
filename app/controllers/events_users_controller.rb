class EventsUsersController < ApplicationController

  def create 
    @event = Event.find(params[:id])
    @user = current_user
    @events_users = EventsUsers.new(:event_id => @event, :user_id => @user)

    if @events_users.save
      flash[:success] = "You're attending!"
    else 
      flash[:danger] = "Try again"
    end
  end

end
