Rails.application.routes.draw do
  resources :post_comments, only: [:create]
  resources :posts
  devise_for :users
  resources :users, only: [:show] do
    collection do
      get :profile
    end
  end
  get 'post/:id/new_comment', to: 'post_comments#new', as: 'new_comment'
  root to: 'home#index'
end
