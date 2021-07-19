class AddAuthenticityToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :authenticity_token, :string
  end
end
