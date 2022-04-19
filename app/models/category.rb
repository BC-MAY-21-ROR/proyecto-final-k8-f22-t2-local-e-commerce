class Category < ApplicationRecord
    has_many :posts, through: :order_details
end
