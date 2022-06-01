class PostsController < ApplicationController
  before_action :set_post, only: %i[ show ]
  before_action :authenticate_user!, except: %i[ index show]
  before_action :set_ranking, only: %i[ show ]
  # GET /posts or /posts.json
  def index
    @posts = Post.active.order(created_at: :desc).page(params[:page])
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = current_user.posts.find_by(id: params[:id])

    unless @post
      redirect_to root_path, alert: 'Ups! No puedes editar este producto'
    end
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Producto creado exitosamente." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post = current_user.posts.find_by(id: params[:id])
    if params[:pictures]
      attachments = ActiveStorage::Attachment.where(id: params[:pictures].values)
      attachments.map(&:purge)
    end
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Producto editado exitosamente." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def delete
    @post = current_user.posts.find_by(id: params[:id])
    Post.delete(@post)

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Producto eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def set_ranking
    # @ranking = [926, 13, 8, 23, 84, 798]
    @ranking = [0, 0, 0, 0, 0, 0]
    @post.post_comments.each do |comment|
      @ranking[comment.ranking] += 1
      @ranking[0] += 1
    end
    
    @rank_prom = 0
    (1..5).each do |i|
      @rank_prom += @ranking[i]*i
    end
    @rank_prom = ((@rank_prom/@ranking[0].to_f)%5).round(1) unless @ranking[0].zero?
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :description, :price, :stock, :delivery, :city, picture: [])
  end
end
