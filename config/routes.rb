Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :parkingspaces
  get "parkingspaces/search", to: "parkingspaces#search", as: :search_parkingspace

  resources :users do
    resources :bookings, only [:new, :create, :show, :edit, :update]
    resources :cars
  end

end
