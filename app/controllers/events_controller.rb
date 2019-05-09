# frozen_string_literal: true

# EventsController
class EventsController < ApplicationController
  before_action :logged_in, only: %i[new create]
  helper_method :user_attending?

  def index
    @past_events = Event.past.includes(:creator)
    @upcoming_events = Event.upcoming.includes(:creator)
  end

  def show
    @event = Event.includes(:creator, :event_attendees).find(params[:id])
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

  def user_attending?
    @event.event_attendees.exists?(current_user.id)
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :description)
  end
end
