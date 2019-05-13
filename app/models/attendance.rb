# frozen_string_literal: true

# Attendance
class Attendance < ApplicationRecord
  belongs_to :event_attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
end
