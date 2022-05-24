class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile, :favorites, :notifications, :messages, :purchases]
  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = current_user
  end

  def	favorites
    @user = current_user
  end

  def notifications
    @user = current_user
  end

  def messages
    @user = current_user
  end

  def purchases
    @user = current_user
  end

  def sold
    @sold = current_user.posts.all.select {|p| p.order_details.length >= 1}
  end

  def seller
    @user = User.find(params[:id])
  end
end
