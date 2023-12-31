# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  root 'home#index'

  get 'home/about', to: 'home#about'
  get 'recipes/random', to: 'recipes#random'
  get 'recipes/random_drink', to: 'recipes#random_drink'
  get 'recipes/search', to: 'recipes#search'
  get 'recipes/:id', to: 'recipes#show', as: 'recipe'

  # Defines the root path route ("/")
  # root "posts#index"
end
