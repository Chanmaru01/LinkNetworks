class Tweet < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  # liked_usersによって投稿が誰にいいねされているのかを簡単に取得できる
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
