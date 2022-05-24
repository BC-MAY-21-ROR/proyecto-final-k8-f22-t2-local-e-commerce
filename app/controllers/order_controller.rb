class OrderController < ApplicationController

	def index
		@orders = current_user.orders.all.order('created_at DESC')#Hay que modificarlo con user.id
		render 'orders/index'
	end

	def show
		@order = Order.find(params[:id])
		render 'orders/show'
	end

	def buy
		@order_details = OrderDetail.buy(order_details_params)
		respond_to do |format|
			if @order_details.save
				post = @order_details.post
				stock = post.stock - @order_details.quantity
				post.update(stock: stock)
				format.html { redirect_to order_path(@order_details.order_id), notice: "Compra realizada con exito" }
				format.json { render :show, status: :created, location:order_details }
			else
				format.html { redirect_to post_url(@order_details.post), status: :unprocessable_entity, alert: @order_details.errors[:quantity][0] }
				format.json { render json: @order_details.errors, status: :unprocessable_entity }
			end
		end
	end

	private
		def order_details_params
			params.require(:order_details).permit(:quantity, :post_id, :price, :user_id)
		end
end
