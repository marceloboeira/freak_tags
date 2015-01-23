Rails.application.routes.draw do

  root "home#index"
  resources :users

  get '/profile/:username', to: 'users#show', as: 'profile'

end
