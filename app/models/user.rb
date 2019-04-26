class User < ApplicationRecord
  has_many :events_users, foreign_key: :event_attendee_id
  has_many :attended_events, through: :events_users
  belongs_to :editor, class_name: "User"

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
