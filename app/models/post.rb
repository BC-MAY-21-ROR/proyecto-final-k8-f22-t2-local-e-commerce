class Post < ApplicationRecord
  has_many :post_comments
  has_many :orders, through: :order_details
  has_many :schedules
  has_many :reservations 
  has_many_attached :picture
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :delivery, presence: true

  enum delivery: {
    "Entrega a domicilio": 0,
    "Retiro en tienda": 1,
    "Punto medio": 2
  }
end
