class DropJoinTableUsersEvents < ActiveRecord::Migration[5.2]
  def change
    drop_join_table :users, :events 
  end
end
