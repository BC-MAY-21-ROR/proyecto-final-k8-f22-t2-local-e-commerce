class UserComment < ApplicationRecord
  belongs_to :user

  validates :ranking, inclusion: { in: 0..5 }
end
