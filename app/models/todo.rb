class Todo < ApplicationRecord
  belongs_to :memo
  acts_as_list scope: [:memo_id]

  validates :position, numericality: { only_integer: true, allow_nil: true }
  validates :content, presence: true
  validates :done, inclusion: { in: [true, false] }

  after_initialize :set_default, if: :new_record?

  private

  def set_default
    self.done = false if self.done.blank?
  end
end
