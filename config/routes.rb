# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'users/:id', to: 'users#show', as: 'user'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'

  get 'new-event', to: 'events#new'
  post 'new-event', to: 'events#create'
  get 'events', to: 'events#index'
  get 'events/:id', to: 'events#show', as: 'event'

  post 'events/:id', to: 'attendances#create', as: 'attending'
end
