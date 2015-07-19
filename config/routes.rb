Rails.application.routes.draw do

  get 'templates/index'

  get 'templates/new'

  get 'templates/create'

  get 'templates/destroy'

  get 'document/index'

  get 'document/new'

  get 'document/create'

  get 'document/destroy'

  resources :suppliers

  resources :depts

   root 'pages#home'
   
   resources :users, except: [:new, :destroy]
   
   get '/register', to: 'users#new'
   
   resources :agreement_types, only: [:new, :create, :show]
   resources :regions, only: [:new, :create, :show]
   
    resources :contracts do
      member do
         post 'like'
      end
   end
   
  Nciapp::Application.routes.draw do
  get 'templates/index'

  get 'templates/new'

  get 'templates/create'

  get 'templates/destroy'

  resources :documents, only: [:index, :new, :create, :destroy]
 
end

resources :templates, only: [:index, :new, :create, :destroy]
   
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
   
  
   
   get '/login', to: "logins#new"
   post '/login', to: "logins#create"
   get '/logout', to: "logins#destroy"
   
   
end
