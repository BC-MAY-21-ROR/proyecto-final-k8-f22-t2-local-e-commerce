class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile, :favorites, :notifications, :messages]
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
  def sold
    # @sold = current_user.posts.where
    @sold = 5
  end
end
