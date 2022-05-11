class PostComment < ApplicationRecord
  belongs_to :post
  has_one :user
  validates :ranking, inclusion: { in: 0..5 }
end
