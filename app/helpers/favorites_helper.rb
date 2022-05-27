module FavoritesHelper
  def link_to_favorite(post)
    @favorite = Favorite.where(post_id: post.id, user_id: current_user.id)
    if @favorite.empty?
      button_to raw("<i class='fa-solid fa-heart'></i>"), favorite_path(post.id), method: :put, class: 'unfavorite-button'
    else
      button_to raw("<i class='fa-solid fa-heart'></i>"), favorite_path(post.id), method: :put, class: 'favorite-button'
    end
  end
end