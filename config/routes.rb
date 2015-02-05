Rails.application.routes.draw do
  root "home#index"
  get "dashboard", to: "dashboard#index", as: "dashboard"

  devise_for :users,
    path: "account",
    path_names: { sign_up: "sign-up",
                  sign_in: "sign-in",
                  sign_out: "sign-out",
                  password: "password",
                  confirmation: "verify",
                  edit: "settings" }

  get "/profile/:username", to: "users#show", as: "profile"

  resources :news, :except => :show
  get "news/:slug" => "news#show", :as => :news_show
end
