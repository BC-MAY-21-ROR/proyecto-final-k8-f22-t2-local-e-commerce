class UserCommentsController < ApplicationController
  before_action :set_user_comment, only: %i[ show edit update destroy ]

  def new
    @user_comment = PostComment.new
    @user_comment.user_id = params[:id]
    @post = Post.find(params[:id])
  end

  def create
    @user_comment = UserComment.new(user_comment_params)
    @user = current_user.posts.find_by(id: params[:id])

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
  def user_comment_params
    params.require(:post_comment).permit(:title, :comment, :ranking, :user_id)
  end
end
