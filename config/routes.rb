Rails.application.routes.draw do
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
  
  
  resources :users, except: [:destroy]
  
  
  get 'payment/index'
  get 'payment/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
  
  resources :appointments do
    member do
      get 'assign_doctor'
    end
  end
  
  
  resources :procedures
  resources :payments
end
