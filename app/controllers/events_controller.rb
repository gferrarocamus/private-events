# frozen_string_literal: true

# EventsController
class EventsController < ApplicationController
  before_action :logged_in, only: %i[new create]

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
    @event_attendees = @event.event_attendees
  end

  def new
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
