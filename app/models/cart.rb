class Cart < ApplicationRecord
  has_and_belongs_to_many :posts
  as_and_belongs_to_many :users
end
