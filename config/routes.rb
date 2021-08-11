Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #  get '/physicians', to: 'physicians#index'
   #get '/appointments/appointment_order', to: 'appointments#appointment_order'
  
   resources :users
   resources :categories
    resources :appointments, only: [:index, :new, :create]
   resources :physicians do 
    resources :appointments, shallow: true 
   end
end

