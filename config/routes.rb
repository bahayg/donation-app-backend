Rails.application.routes.draw do
  resources :requests
  resources :charities
  resources :users
  resources :auth, only: [:create, :show]
  get 'users/:id/charities', to: "users#get_users_charities"
  get 'users/:user_id/charities/:charity_id', to: "charities#get_charities_requests"
  # post '/login', to: 'auth#create'
  # get '/profile', to: 'users#profile'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
