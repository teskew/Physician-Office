Rails.application.routes.draw do
  root to: 'sessions#welcome'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

   resources :categories
    resources :appointments, only: [ :new, :index, :create]
    resources :physicians do 
    resources :appointments, shallow: true 
   end
   resources :users
end

