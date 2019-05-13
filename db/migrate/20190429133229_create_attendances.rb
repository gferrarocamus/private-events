# frozen_string_literal: true

# CreateAttendances
class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances, &:timestamps
  end
end
