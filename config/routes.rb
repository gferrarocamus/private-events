Rails.application.routes.draw do
  root 'users#new'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'profile', to: 'users#show'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'

  get 'new-event', to: 'events#new'
  post 'new-event', to: 'events#create'
  get 'event/:id', to: 'events#show'
  get 'events', to: 'events#index'
end
