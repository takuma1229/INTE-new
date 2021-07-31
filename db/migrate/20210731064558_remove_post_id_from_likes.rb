class RemovePostIdFromLikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :likes, :micropost_id, :integer
  end
end
