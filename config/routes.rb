Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :post_comments, only: [:create]
  resources :order, only: [:show]
  resources :users, only: [:show] do
    collection do
      get :profile
      get :favorites
      get :purchases
      get :posts
      get :sold
    end
    member do
      put :update_avatar
      put :update_cover
    end
  end
  get 'posts/:id/new_comment', to: 'post_comments#new', as: 'new_comment'
  post 'posts/:id/buy_product', to: 'order#buy', as: 'buy_product' 
  root to: 'home#index'
  put 'posts/:id/favorite', to: 'favorites#change_favorite', as: 'favorite'
  get '/search', to: 'home#results', as: 'search'
end
