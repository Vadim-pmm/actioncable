Rails.application.routes.draw do
  root 'welcome#about'
  devise_for :users

  mount ActionCable.server => '/cable'

  resources :chatrooms, only: [:show, :create], param: :slug
  resources :messages, only: [:create]
end
