Rails.application.routes.draw do
  resources :followings

  resources :favorites

  resources :users

  resources :comments

  root 'photos#index'

  resources :photos
end
