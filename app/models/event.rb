# frozen_string_literal: true

# Event
class Event < ApplicationRecord
  has_many :attendance, foreign_key: :attended_event_id, inverse_of: :attendances, dependent: :destroy
  has_many :event_attendees, -> { distinct }, through: :attendance
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
