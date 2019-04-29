class Event < ApplicationRecord
  has_many :events_users, foreign_key: :attended_event_id
  has_many :event_attendees, through: :events_users
  belongs_to :creator, class_name: 'User'

  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
