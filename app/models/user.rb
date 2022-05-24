class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  has_many :orders
  has_many :posts, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one_attached :avatar
  has_one_attached :cover_photo
end
