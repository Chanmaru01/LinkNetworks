class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
    validates :user_name, presence: true
    validates :pr, length: { maximum: 200 }
    
  # image の追加
    mount_uploader :image, ImageUploader

    has_many :tweets, dependent: :destroy

  # コメント機能
    has_many :comments

  # いいね機能
    has_many :likes, dependent: :destroy
    has_many :liked_tweets, through: :likes, source: :tweet

  # お気に入り機能
    has_many :favorites, dependent: :destroy
    has_many :favorited_tweets, through: :favorites, source: :tweet

  #Todo機能
  has_many :memos

  # 投稿に対して、すでにいいねをしているか判定する
      def already_liked?(tweet)
        self.likes.exists?(tweet_id: tweet.id)
      end
    # def like_this(clicked_tweet)
    #   self.likes.find_or_create_by(tweet: clicked_tweet)
    # end

  # 投稿に対して、すでにいいねをしているか判定する
      def already_favorited?(tweet)
        self.favorites.exists?(tweet_id: tweet.id)
      end
end
