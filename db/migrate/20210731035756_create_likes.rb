class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.timestamps
      t.index [:user_id, :post_id], unique: true   # 同じユーザーが同じ投稿をお気に入りできないようにしている
    end
  end
end