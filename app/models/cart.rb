class Cart < ApplicationRecord
  has_and_belongs_to_many :posts
  has_and_belongs_to_many :users
  before_validation :validate_stock
<<<<<<< HEAD
  def self.buy(user)
    carts= Cart.where(status: true, user_id: user.id)
    carts.each do |cart|
      total = cart.price*cart.quantity
    order = Order.create(total:total, user_id:user.id)
    order_detail = OrderDetail.create(price:cart.price, quantity:cart.quantity,
                          post_id:cart.post_id, order_id:order.id)
    order_detail
    end
    Cart.where(status: true, user_id: user.id).update_all(status: false)
  end

  def self.eliminate(id)
    Cart.where(id: id).update(status: false)
  end
  def self.total(user)
    carts = Cart.where(status: true, user_id: user.id)
    total = 0
    carts.each do |cart|
      total+=cart.quantity*cart.price
    end
    total
  end
  def self.products(user)
    Cart.where(status: true, user_id: user.id).count
=======

  def self.buy(user)
    puts(user)
    Cart.where(status: true, user_id: user.id).update_all(status: false)
  end
  def self.post(post_id)
    post = Post.find(post_id)
>>>>>>> 009dafa2134cb69d2b1177b2a92c92a3620a822c
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
