class RemoveAuthenticityTokenFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :authenticity_token, :string
  end
end
