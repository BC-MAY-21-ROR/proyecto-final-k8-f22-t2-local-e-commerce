class OrderController < ApplicationController

	def index
		@orders = current_user.orders.all.order('created_at DESC')#Hay que modificarlo con user.id
		render 'orders/index'
	end

	def buy
		@order_details = OrderDetail.buy(order_details_params)
		respond_to do |format|
				if @order_details.save
					format.html { redirect_to action: "index", notice: "Compra realizada con exito" }
					format.json { render :index, status: :created, location:order_details }
				else
					format.html { redirect_to post_url(@order_details.post), status: :unprocessable_entity }
					format.json { render json: @order_details.errors, status: :unprocessable_entity }
				end
		  end
	end

	private
		def order_details_params
			params.require(:order_details).permit(:quantity, :post_id, :price, :user_id)
		end
end