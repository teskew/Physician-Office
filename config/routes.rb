Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #  get '/physicians', to: 'physicians#index'
   #get '/physician/:id', to: 'physician#show', as: 'physician'
  resources :physicians, only: [:new, :create, :index]
  resources :physicians  do
     resources :appointments, shallow: true
  end
  # resources :Appointement do 
  #   resources :shoes, shallow: true 

   
  
end
