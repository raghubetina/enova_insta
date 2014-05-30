Rails.application.routes.draw do
  devise_for :users
  resources :followings

  resources :favorites

  resources :users

  resources :comments

  root 'photos#index'

  resources :photos
end
