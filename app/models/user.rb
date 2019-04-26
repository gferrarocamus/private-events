class User < ApplicationRecord
  has_many :events_users, foreign_key: :event_attendee_id
  has_many :attended_events, through: :events_users
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
