class Post < ApplicationRecord
  has_many :post_comments
  has_many :orders, through: :order_details
  has_many :schedules
  has_many :reservations 
  has_many_attached :picture
  has_one :user

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :picture, presence: true
end
