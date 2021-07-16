class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mother_tongue, :string
    add_column :users, :japanese_level, :string
    add_column :users, :english_level, :string
    add_column :users, :gender, :string
    add_column :users, :region, :string
    add_column :users, :purpose, :string
    add_column :users, :self_introduction, :text
    add_column :users, :skype, :string
    add_column :users, :discord, :string
    add_column :users, :other, :string
  end
end
