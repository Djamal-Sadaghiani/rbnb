Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "parkingspaces/search", to: "parking_spaces#search", as: :search_parkingspace
  resources :parking_spaces do
    resources :bookings, only: [:new, :create, :show, :edit, :update]
  end
  resources :cars
  resources :bookings, only: [:index]

end
