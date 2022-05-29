class Cart < ApplicationRecord
  has_and_belongs_to_many :posts
  has_and_belongs_to_many :users
  before_validation :validate_stock

  def self.buy(user)
    puts(user)
    Cart.where(status: true, user_id: user.id).update_all(status: false)
  end
  def self.post(post_id)
    post = Post.find(post_id)
  end
  def validate_stock
    post = Post.find(post_id)
    if post.stock >= quantity && quantity > 0
      return
    else
      errors.add(:quantity, "La cantidad solicitada excede el nivel de stock")
    end
  end
end
