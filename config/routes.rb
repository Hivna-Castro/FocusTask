Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

 get 'signup', to: 'users#new', as: 'signup'     # para se cadastrar
 post 'users', to: 'users#create'                # criar um novo usuário
 get 'login', to: 'sessions#new', as: 'login'    # para logar
 post 'login', to: 'sessions#create'             # autenticar o usuário
 delete 'logout', to: 'sessions#destroy', as: 'logout' 

 root 'tasks#index'
 
 resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy] 
 resources :categories, only: [:index, :create, :edit, :update, :destroy] 
end
