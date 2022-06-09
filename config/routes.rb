Rails.application.routes.draw do
  devise_for :users,controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'

  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  
  resources :oprator, except: ['show']
  resources :buses 
  
     
  resources :passanger_details

  resources :admin, except: ['show'] do 
    member do 
      post 'update_status'
    end
  end
  get '/admin/update_status/:id' => 'admin#update_status'
  resources :user, except: ['show']
     
 
  get '/admin/view_oprators' => 'admin#view_oprator'
  get '/admin/view_users' => 'admin#view_user'
  get'/user/search_bus' => 'user#search'
  get '/booking/:bus_id/:travel_schedule_id' => 'booking#seat_selection' 
 # match '/booking/:bus_id/:travel_schedule_id' => 'booking#seat_selection' ,via: [:get, :post]
  post'/booking/:bus_id/:travel_schedule' => 'booking#update'
  get '/oprator/:bus_id/travel_schedules' => 'oprator#show_travel_schedules', as: :show_travel_schedules
  get '/oprator/:bus_id/travel_schedules/:travel_schedule_id/seats_status' => 'oprator#show_seat_status',as: :seats_status
  post'/admin/update_status/:id'=>"admin#update_status", as: :user_update_status
  #  get 'seats_status', on: :collection
end
