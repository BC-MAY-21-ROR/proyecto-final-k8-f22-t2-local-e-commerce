class UserCommentsController < ApplicationController
  before_action :set_user_comment, only: %i[ show edit update destroy ]

  def new
    puts "=_______________"
    puts 'new'
    puts "=_______________"
    @user_comment = UserComment.new
    @user_comment.user_id = params[:id]
    @user = User.find(params[:id])
  end

  def create
    puts "=_______________"
    puts 'create'
    puts "=_______________"
    @user_comment = UserComment.new(user_comment_params)
    @users = User.all
    @user = current_user.posts.find_by(id: params[:id])

    respond_to do |format|
      if @user_comment.save
        puts 'UserComment was successfully created.'
        format.html { redirect_to user_path(@user_comment.user_id), notice: "Usted a posteado un comentario" }
        format.json { render :show, status: :created, location: @post_comment }
      else
        puts "Salio mal tu chingadera"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_comment_params
    params.require(:user_comment).permit(:title, :comment, :ranking, :user_id)
    # params.fetch(:post_comment, {}).permit(:title, :comment, :ranking, :user_id)
  end
end
