Rails.application.routes.draw do

  resources :librariers
  resources :books
  
  root 'home#index'

  #criacao de bibliotecarios
  get '/registration', to: 'librariers#new'
  post '/registration', to: 'librariers#create'
  
  get '/librariers', to: 'librariers#index'
  
  #autenticacao de bibliotecarios
  get    '/lib',   to: 'sessions#librariers'
  post   '/lib',   to: 'sessions#login'
  delete '/finish', to: 'sessions#finish'
  #delete '/librariers',  to: 'sessions#destroy'

  get '/books', to: 'books#new'
  post '/books', to: 'books#create'

  get '/livros', to: 'books#index'

  

  get    '/admins',   to: 'sessions#admins'
  post   '/admins',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  

  #resources: admins
  


end
