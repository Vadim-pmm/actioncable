Rails.application.routes.draw do
  root 'chatrooms#index'
  #root 'welcome#about'

  devise_for :users

  mount ActionCable.server => '/cable'

  resources :chatrooms
  resources :messages
end
