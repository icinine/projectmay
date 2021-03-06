Rails.application.routes.draw do
    
   root 'pages#home'
   
   get '/login', to: "logins#new"
   post '/login', to: "logins#create"
   get '/logout', to: "logins#destroy"

   get '/register', to: 'users#new'
   
   resources :agreement_types, only: [:new, :create, :show]
   resources :regions, only: [:new, :create, :show]
   resources :documents, only: [:index, :new, :create, :destroy]
   resources :templates, only: [:index, :new, :create, :destroy]
   resources :suppliers
   resources :depts
   resources :users, except: [:new]
   
   resources :contracts do
      member do
         post 'like'
      end
   end
   
  
  
   #get '/contracts', to: 'contracts#index'
   #get '/contracts/new', to: 'contracts#new', as: 'new_contract'
   ##post request used to submit new information to the database
   #post '/contracts', to: 'contracts#create'
   #get 'contracts/:id/edit', to: 'contracts#edit', as: 'edit_contract'
   #patch 'contracts/:id',to: 'contracts#update'
   #get 'contracts/:id', to: 'contracts#show', as: 'contract'
   #delete 'contracts/:id', to: 'contracts#destroy'
   
   # While I could have simply used resources :contracts but for learning 
   # purposes I am completing as much of this project manually as possible.

   
   
end
