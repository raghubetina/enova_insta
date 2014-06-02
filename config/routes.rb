Rails.application.routes.draw do
  devise_for :users

  get 'my_wall' => 'photos#wall'
  get 'timeline' => 'photos#timeline'
  get 'my_favorites' => 'photos#favorites'

  resources :followings

  resources :favorites

  resources :users

  resources :comments

  root 'photos#index'

  resources :photos
end
