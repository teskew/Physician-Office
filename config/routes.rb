Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #  get '/physicians', to: 'physicians#index'
   get '/appointments/most_appointment', to: 'appointments#most_appointement'
   resources :appointments 
   resources :physicians, only: [:index, :create, :new]
  resources :physicians  do
     resources :appointments, shallow: true
  end
  
   
  
end
