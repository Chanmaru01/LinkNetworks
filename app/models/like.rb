class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  
# validates_uniqueness_ofによりtweet_idとuser_idの組が1組しかないように
# バリデーションをかけました（1つしかいいねをつけられないようにする）
  validates_uniqueness_of :tweet_id, scope: :user_id
end
