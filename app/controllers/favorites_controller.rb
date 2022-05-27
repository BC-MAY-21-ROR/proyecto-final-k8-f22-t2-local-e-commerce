class FavoritesController < ApplicationController
  def change_favorite
    @favorite = Favorite.where(post_id: params[:id]).where(user_id: current_user.id)
    if @favorite.empty?
      @favorite = Favorite.create(post_id: params[:id], user_id: current_user.id)
      redirect_back fallback_location: root_path
    else
      @favorite.destroy_all
      redirect_back fallback_location: root_path
    end
  end
end