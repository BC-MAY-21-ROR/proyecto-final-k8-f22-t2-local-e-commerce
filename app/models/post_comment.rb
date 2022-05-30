class PostComment < ApplicationRecord
  belongs_to :post, dependent: :destroy
  has_one :user
  validates :ranking, inclusion: { in: 0..5 }
end
