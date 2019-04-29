# frozen_string_literal: true

# User
class User < ApplicationRecord
  has_many :attendance, foreign_key: :event_attendee_id, inverse_of: :attendances, dependent: :destroy
  has_many :attended_events, -> { distinct }, through: :attendance
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event', inverse_of: :creator, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
