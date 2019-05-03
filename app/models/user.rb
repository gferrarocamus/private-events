# frozen_string_literal: true

# User
class User < ApplicationRecord
  has_many :attendances, class_name: 'Attendance',
                         inverse_of: :event_attendee, foreign_key: :event_attendee_id, dependent: :destroy
  has_many :attended_events, -> { distinct }, through: :attendances
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event', inverse_of: :creator, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def previous_events(kind)
    send("#{kind}_events").where('date < ?', Time.now.in_time_zone)
  end

  def upcoming_events(kind)
    send("#{kind}_events").where('date > ?', Time.now.in_time_zone)
  end
end
