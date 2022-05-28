class Cart < ApplicationRecord
  has_and_belongs_to_many :posts
  has_and_belongs_to_many :users
  before_validation :validate_stock

  def self.buy(params)
    total = params[:price].to_i*params[:quantity].to_i
    order = Order.create(total:total, user_id:params[:user_id])
    order_detail = create(price:params[:price], quantity:params[:quantity], 
                          post_id:params[:post_id], order_id:order.id)
    order_detail
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
