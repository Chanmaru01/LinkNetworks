class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
    validates :user_name, presence: true
    validates :pr, length: { maximum: 200 }

    has_many :tweets, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_tweets, through: :likes, source: :tweet
    def already_liked?(tweet)
      self.likes.exists?(tweet_id: tweet.id)
    end
end
