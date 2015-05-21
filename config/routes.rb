Rails.application.routes.draw do
  root 'home#index'
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get '/@:username', to: 'account#show', as: 'profile'
  get '/@:username/follow', to: 'follows#follow', as: 'follow'
  get '/@:username/unfollow', to: 'follows#unfollow', as: 'unfollow'

  # Account Devise
  devise_for :users,
    path: 'account',
    controllers: {
      registrations: 'account/registrations',
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


  resources :tags
end
