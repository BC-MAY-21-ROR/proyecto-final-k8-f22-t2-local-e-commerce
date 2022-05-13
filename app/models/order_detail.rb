class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :post
  def self.buy(params)
    total = params[:price].to_i*params[:quantity].to_i
    order = Order.create(total:total, user_id:params[:user_id])
    order_detail = create(price:params[:price], quantity:params[:quantity], 
                          post_id:params[:post_id], order_id:order.id)
    order_detail
  end
end
