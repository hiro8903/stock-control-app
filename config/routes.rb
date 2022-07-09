Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup', to:'users#new'

  # ログイン機能
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
end
