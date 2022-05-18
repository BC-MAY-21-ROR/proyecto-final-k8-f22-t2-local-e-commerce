class PostsController < ApplicationController
  before_action :set_post, only: %i[ show ]
  before_action :authenticate_user!, except: %i[ index show]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
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
      redirect_to root_path, alert: 'You can only edit your own posts'
    end
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    # redirect_to edit_post_path(@post)
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
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
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :description, :price, :pictures, :stock, :delivery, picture: [])
  end
end
