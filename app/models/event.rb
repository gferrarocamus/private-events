class Event < ApplicationRecord
  has_many :attendance, foreign_key: :attended_event_id
  has_many :event_attendees, -> { distinct }, through: :attendance
  belongs_to :creator, class_name: 'User'

  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
