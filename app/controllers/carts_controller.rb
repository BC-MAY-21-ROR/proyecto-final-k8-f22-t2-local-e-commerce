class CartsController < ApplicationController
    def index
		@carts = Cart.all.order('created_at DESC')#Hay que modificarlo con user.id
		@total = Cart.total(current_user);
		render 'carts/index'
	end

	def show
		@cart = Cart.find(params[:id])
		@total = Cart.total(current_user)
		@products = Cart.products(current_user)
		render 'carts/show'
	end

	def add
		@carts = Cart.new(carts_params)
		respond_to do |format|
			if @carts.save
				post = Post.find(@carts.post_id)
				stock = post.stock - @carts.quantity
				post.update(stock: stock)
				format.html { redirect_to show_product_cart_path(@carts), notice: "Los productos se agregaron al carrito con exito" }
				format.json { render :show, status: :created, location:carts }
			else
				format.html { redirect_to post_url(Post.find(@carts.post_id)), status: :unprocessable_entity, alert: @carts.errors[:quantity][0] }
				format.json { render json: @carts.errors, status: :unprocessable_entity }
			end
		end
	end
	def buy
		Cart.buy(current_user)
		respond_to do |format|
		format.html { redirect_to carts_path, notice: "Los productos se compraron con exito" }
		end
	end
	def delete
		@cart = Cart.find(params[:id])
		post = Post.find(@cart.post_id)
		stock = post.stock + @cart.quantity
        Cart.eliminate(@cart.id)

       redirect_to carts_path, status: :see_other
	end
	private
		def carts_params
			params.require(:carts).permit(:id, :quantity, :post_id, :price, :user_id)
		end
end
