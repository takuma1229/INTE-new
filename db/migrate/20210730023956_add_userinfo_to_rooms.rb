class AddUserinfoToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :creater_id, :integer
    add_column :rooms, :companion_id, :integer
  end
end
