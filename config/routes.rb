Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get "parkingspaces/search", to: "parkingspaces#search", as: :search_parkingspace
  resources :parking_spaces do
    resources :bookings, only: [:new, :create, :show, :edit, :update]
  end
  resources :cars

end
