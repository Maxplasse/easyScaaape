Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'mon_profil', to: 'profiles#show', as: :mon_profil
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms, only: [:index, :show ] do
    resources :bookings, only: [:new, :create]
  end
end
