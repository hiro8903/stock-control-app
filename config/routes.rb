Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup', to:'users#new'
  resources :users
end
