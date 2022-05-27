class Post < ApplicationRecord
  has_many :post_comments
  has_many :orders, through: :order_details
  has_many :order_details
  has_many :schedules
  has_many :reservations 
  has_many_attached :picture
  belongs_to :user
  has_many :favorites

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :delivery, presence: true
  validates :picture, presence: true
  validates :title, length: { maximum: 30 }

  enum delivery: {
    "Entrega a domicilio": 0,
    "Retiro en tienda": 1,
    "Punto medio": 2
  }

  def get_ranking
    self.post_comments.average(:ranking)
  end
end
