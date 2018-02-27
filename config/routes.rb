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
  get '/user/:id/bookings', to: 'bookings#userlist', as: 'user_bokings'
  get '/user/:id/rent_requests', to: 'bookings#rent_requests', as: 'rent_requests'
  get '/user/:id/my_bikes', to: 'bikes#my_bikes', as: 'my_bikes'

end
