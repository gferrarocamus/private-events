module EventsHelper
  def user_attending
    @event.event_attendees.exists?(current_user.id)
  end
end
