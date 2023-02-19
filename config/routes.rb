Rails.application.routes.draw do
  
  concern :with_datatable do
    post 'datatable', on: :collection
  end
  
  namespace :appointment do
    get 'steps/show'
    get 'steps/update'
  end
  get 'users/index'
  get 'users/show'
  
  devise_for :users, :skip => [:registration], :controllers => { :users => "users" }
    as :user do
      authenticated :user do
      root "pages#dashboard", as: :authenticated_root
      end
    
      unauthenticated :user do
        root "pages#home", as: :unauthenticated_root
    end
  end
  
  devise_scope :user do  
     get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  
  
  resources :users, except: [:destroy], concerns: [:with_datatable]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
  
  resources :appointments, concerns: [:with_datatable] do
    resources :steps, only: [:show, :update], controller: 'appointment/steps'
    
    member do
      get 'assign_doctor'
      get 'cancel'
    end
  end
  
  
  resources :procedures, concerns: [:with_datatable] do
    member do
      get 'show_timeslots'
    end
  end
  
  
  resources :payments, concerns: [:with_datatable]
    
  
  
  resources :timeslots do
    member do
      get 'remove_time'
    end 
  end
  
 get 'reports/dashboard', to: 'reports#dashboard'
 get 'update_report', to: 'reports#update_report'
 get 'download_appointments_report', to: 'reports#download_appointments_report'
 get 'download_procedures_report', to: 'reports#download_procedures_report'
 get 'download_payments_report', to: 'reports#download_payments_report'
 get 'gp', to: 'pages#gp'
  
end
