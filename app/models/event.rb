# frozen_string_literal: true

# Event
class Event < ApplicationRecord
  has_many :attendances, class_name: 'Attendance', foreign_key: :attended_event_id, dependent: :destroy
  has_many :event_attendees, -> { distinct }, through: :attendances
  belongs_to :creator, class_name: 'User'

  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true

  scope :past, -> { where('date < ?', Time.now.in_time_zone) }
  scope :upcoming, -> { where('date > ?', Time.now.in_time_zone) }

  # def self.past
  #   where("date < ?", Time.now)
  # end

  # def self.upcoming
  #   where("date > ?", Time.now)
  # end
end
