Rails.application.routes.draw do
  resource :users, only: [:create]
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
  post '/apply', to: 'users#apply'

  resources :jobs

  root 'jobs#index'
end
