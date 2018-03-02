Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'
  resources :items do
    resources :bookings, only: [:new, :create, :index, :show]
    get 'index_by_user', to: "bookings#index_by_user"
  end
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
