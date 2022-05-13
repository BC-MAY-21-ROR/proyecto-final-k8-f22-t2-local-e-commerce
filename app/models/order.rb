class Order < ApplicationRecord
    has_many :order_details
    has_many :posts, through: :order_details
    has_one :user
end
