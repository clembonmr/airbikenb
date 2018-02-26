Rails.application.routes.draw do


  devise_for :users
  root to: 'bikes#index'

  resources :bikes do
    resources :bookings
  end

  resources :bookings do
    member do
    patch "confirm"
    patch "decline"
    resources :reviews, only: [:create, :new]
  end
end
  get '/profile/:id', to: 'users#show', as: 'profile';

end
