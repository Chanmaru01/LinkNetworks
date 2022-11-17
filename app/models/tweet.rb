class Tweet < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  # image の追加
      mount_uploader :image, ImageUploader
  # liked_usersによって投稿が誰にいいねされているのかを簡単に取得できる
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  # 上記と同様
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
