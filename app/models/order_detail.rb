class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :post
  before_validation :validate_stock
  
  def self.buy(params)
    total = params[:price].to_i*params[:quantity].to_i
    order = Order.create(total:total, user_id:params[:user_id])
    order_detail = create(price:params[:price], quantity:params[:quantity], 
                          post_id:params[:post_id], order_id:order.id)
    order_detail
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
