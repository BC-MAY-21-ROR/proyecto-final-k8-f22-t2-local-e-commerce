class CartsController < ApplicationController
    def index
		@carts = current_user.carts.all.order('created_at DESC')#Hay que modificarlo con user.id
		render 'carts/index'
	end

	def show
		@order = Cart.find(params[:id])
		render 'carts/show'
	end

	def add
		@carts = Cart.new(carts_params)
		respond_to do |format|
			if @carts.save
				post = @carts.post
				stock = post.stock - @carts.quantity
				post.update(stock: stock)
				format.html { redirect_to carts_path(@carts.order_id), notice: "Los productos se agregaron al carrito con exito" }
				format.json { render :show, status: :created, location:carts }
			else
				format.html { redirect_to post_url(@carts.post), status: :unprocessable_entity, alert: @carts.errors[:quantity][0] }
				format.json { render json: @carts.errors, status: :unprocessable_entity }
			end
		end
	end

	private
		def carts_params
			params.require(:carts).permit(:quantity, :post_id, :price)
		end
end
