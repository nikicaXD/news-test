Rails.application.routes.draw do
  # resources :playlists
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :posts
  resources :articles
  resources :genres
  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "search#index"
  # get '/search/:q', to: 'home#search', as: :homesearch
  # get '/search/:q', to: 'home#search', as: :search
  get '/artist/:id', to: 'profile#show', as: :profile
  get '/new-post/:article_id', to: 'posts#new', as: :articlepost
  resources :search, :only => [:index]

  get '/following', to: 'profile#following', as: :following
  post '/artist/:id/follow', to: 'profile#follow', as: :follow
  post '/artist/:id/unfollow', to: 'profile#unfollow', as: :unfollow

end
