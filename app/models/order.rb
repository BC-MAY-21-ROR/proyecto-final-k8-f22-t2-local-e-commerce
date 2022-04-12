class Order < ApplicationRecord
    has_many :posts, through: :order_details
end
