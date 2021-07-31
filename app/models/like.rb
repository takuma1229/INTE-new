class Like < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
  #一人のユーザーは、一つの投稿に対しては1つしかいいねをつけられない
  validates_uniqueness_of :micropost_id, scope: :user_id
end
