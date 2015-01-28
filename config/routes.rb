Rails.application.routes.draw do

  root 'home#index' # TODO: Make signed-in root as Dashboard
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'

  # Account Devise
  devise_for :users,
    path: "account",
    path_names: {
      sign_up: 'sign-up',
      sign_in: 'sign-in',
      sign_out: 'sign-out',
      password: 'password',
      confirmation: 'verify'
  }


  # Account
  get '/account', to: 'account#settings'
  get '/account/settings', to: 'account#settings', as: 'account_settings'
  post '/account/settings', to: 'account#update', as: 'account_update'

  # Profile
  get '/profile/:username', to: 'users#show', as: 'profile'


  resources :users
end
