# frozen_string_literal: true

class AddIdsToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :event_attendee_id, :integer
    add_column :attendances, :attended_event_id, :integer
  end
end
