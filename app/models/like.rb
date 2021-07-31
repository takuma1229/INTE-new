class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  #ユーザーAはマイクロポストAに対して1つしかいいねをつけられない
  validates_uniqueness_of :post_id, scope: :user_id
end
