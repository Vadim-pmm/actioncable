Rails.application.routes.draw do
  root 'chatrooms#show'
  #root 'welcome#about'

  devise_for :users

  mount ActionCable.server => '/cable'

  resources :chatrooms
  resources :messages
end
