Rails.application.routes.draw do
  root 'photos#index'

  # CREATE
  get    'photos/new' => 'photos#new', :as => 'new_photo'
  post   'photos' => 'photos#create', :as => 'photos'

  # READ
  get    'photos' => 'photos#index'
  get    'photos/:id' => 'photos#show', :as => 'photo'

  # UPDATE
  get    'photos/:id/edit' => 'photos#edit', :as => 'edit_photo'
  patch  'photos/:id' => 'photos#update'

  # DELETE
  delete 'photos/:id' => 'photos#destroy'
end
