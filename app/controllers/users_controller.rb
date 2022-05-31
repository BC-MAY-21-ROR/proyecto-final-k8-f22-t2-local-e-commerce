class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile, :favorites, :notifications, :messages, :purchases]
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
    @user_posts = current_user.posts.active.order("created_at DESC")
  end

  def sold
    @sold = current_user.posts.all.order("created_at DESC").select {|p| p.order_details.length >= 1}
  end
end
