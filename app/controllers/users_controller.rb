class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :authenticate_user!, only: [:profile, :favorites, :notifications, :messages, :purchases]
  before_action :set_ranking, only: %i[ show ]
  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = current_user
  end

  def update_avatar
    @user = current_user
    @user.avatar = params[:user][:avatar]
    @user.save
    redirect_to profile_users_path
  end

  def update_cover
    @user = current_user
    @user.cover_photo = params[:user][:cover_photo]
    @user.save
    redirect_to profile_users_path
  end

  def	favorites
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).includes(:post)
  end

  def notifications
    @user = current_user
  end

  def messages
    @user = current_user
  end

  def purchases
    @bought = current_user.orders.all.order("created_at DESC")
  end

  def posts
    @user_posts = current_user.posts.all.order("created_at DESC")
  end

  def sold
    @sold = current_user.posts.all.order("created_at DESC").select {|p| p.order_details.length >= 1}
  end


  private
  def set_user
    @user = User.find(params[:id])
  end
  def set_ranking
    # @ranking = [926, 13, 8, 23, 84, 798]
    @ranking_user = [0, 0, 0, 0, 0, 0]
    @user.user_comments.each do |comment|
      @ranking_user[comment.ranking] += 1
      @ranking_user[0] += 1
    end

    @rank_prom = @user.user_comments.average(:ranking)
  end
end
