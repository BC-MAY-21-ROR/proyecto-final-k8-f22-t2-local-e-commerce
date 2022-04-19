class PostComment < ApplicationRecord
  belongs_to :post
  validates :ranking, inclusion: { in: 0..5 }
end
