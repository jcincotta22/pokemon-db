Rails.application.routes.draw do
  root 'pokemons#index'
  resources :pokemons, only: [:index, :new, :create] 
  resources :users, only: [:index]

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
