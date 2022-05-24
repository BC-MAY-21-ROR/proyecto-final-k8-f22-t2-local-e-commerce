class PostCommentsController < ApplicationController
  before_action :set_post_comment, only: %i[ show edit update destroy ]

  def new
    @post_comment = PostComment.new
    @post_comment.post_id = params[:id]
  end

  # POST /post_comments or /post_comments.json
  def create
    @post_comment = PostComment.new(post_comment_params)

    respond_to do |format|
      if @post_comment.save
        format.html { redirect_to post_url(@post_comment.post), notice: "Usted a posteado un comentario" }
        format.json { render :show, status: :created, location: @post_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def post_comment_params
      params.fetch(:post_comment, {}).permit(:title, :comment, :ranking, :post_id)
    end
end
