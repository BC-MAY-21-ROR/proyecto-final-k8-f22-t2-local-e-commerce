class Post < ApplicationRecord
  belongs_to :type
  has_many :post_comments
  has_many :orders, through: :order_details
  has_many :schedules
  has_many :reservations 
  has_many_attached :picture
end
