Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :post_comments, only: [:create]
  resources :order, only: [:index, :show]
  resources :users, only: [:show] do
    collection do
      get :profile
    end
  end
  get 'post/:id/new_comment', to: 'post_comments#new', as: 'new_comment'
  post 'post/:id/buy_product', to: 'order#buy', as: 'buy_product' 
  root to: 'home#index'
end
