# app/models/events_users.rb
class EventsUsers < ActiveRecord::Base
  belongs_to :event_attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
end
