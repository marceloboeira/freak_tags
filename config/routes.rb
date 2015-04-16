Rails.application.routes.draw do
  root 'home#index'
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get '/@:username', to: 'account#show', as: 'profile'

  # Account Devise
  devise_for :users,
    path: 'account',
    controllers: {
      registrations: "account/registrations",
      sessions: "account/sessions"
    },
    path_names: {
      sign_up: 'sign-up',
      sign_in: 'sign-in',
      sign_out: 'sign-out',
      password: 'password',
      confirmation: 'verify',
      edit: 'settings'
    }
  resources :news
  get '/news/:id/destroy', to: 'news#destroy', as: 'destroy_news'
end
