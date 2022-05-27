class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def word
  end
end
