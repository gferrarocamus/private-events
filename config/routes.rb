Rails.application.routes.draw do
  root 'events#index'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'profile', to: 'users#show'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'

  get 'new-event', to: 'events#new'
  post 'new-event', to: 'events#create'
  get 'events/:id', to: 'events#show', as: 'event'
  get 'events', to: 'events#index'

  post 'events/:id', to: 'attendances#create', as: 'attendance'
end
