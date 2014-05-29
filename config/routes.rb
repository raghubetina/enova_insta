Rails.application.routes.draw do
  resources :comments

  root 'photos#index'

  resources :photos
end
