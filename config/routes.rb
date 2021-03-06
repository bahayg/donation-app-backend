Rails.application.routes.draw do
  resources :requests
  resources :charities
  resources :users
  resources :auth, only: [:create, :show]
  get 'users/:id/charities', to: "users#get_users_charities"
  get 'users/:user_id/charities/:charity_id', to: "charities#get_charities_requests"
  get 'users/:user_id/requests', to: "users#get_users_requests"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
