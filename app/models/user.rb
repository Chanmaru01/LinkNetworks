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
          has_many :likes, dependent: :destroy
          has_many :liked_tweets, through: :likes, source: :tweet

              def already_liked?(tweet)
                self.likes.exists?(tweet_id: tweet.id)
              end

              # def like_this(clicked_tweet)
              #   self.likes.find_or_create_by(tweet: clicked_tweet)
              # end
end
