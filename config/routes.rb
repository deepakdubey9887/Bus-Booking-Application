Rails.application.routes.draw do
  devise_for :users,controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'

  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  
  resources :oprator
  resources :buses,except: ['show'] 
     get'/buses/:id/seat'=>'buses#seat'
    

  resources :admin, except: ['show']
  resources :user, except: ['show']
     
 
  get '/admin/view_oprators' => 'admin#view_oprator'
  get '/admin/view_users' => 'admin#view_user'
  

  #get '/admin/:id' => 'admin#show'
end
