class AddMicropostIdToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :micropost_id, :integer
  end
end
