class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
  end

  def new
    @user = current_user
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :description)
  end
end