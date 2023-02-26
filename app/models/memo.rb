class Memo < ApplicationRecord
  belongs_to :user
  has_many :todos, -> { order("done ASC, position ASC").includes(:memo) }, dependent: :destroy

  validates :title, presence: true
end
