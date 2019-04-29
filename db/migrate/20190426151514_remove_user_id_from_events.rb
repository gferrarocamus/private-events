# frozen_string_literal: true

class RemoveUserIdFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :user_id, :integer
  end
end
