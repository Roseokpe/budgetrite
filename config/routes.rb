Rails.application.routes.draw do
  devise_for :users
  get '/user/:user_id', to: 'users#show', as: 'user'

  resources :groups, except: [:edit, :update]
  resources :entities, only: [:new, :create, :destroy]

  post '/entities/new', to: 'entities#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "groups#index"

end
