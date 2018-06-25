Rails.application.routes.draw do

  resources :librariers
  resources :books
  resources :students
  resources :admins
  resources :loans
  resources :devolutions
  
  root 'home#index'

  get '/admin', to: 'admins#new'
  post '/admin', to: 'admins#create'
  get '/admins', to: 'admins#index'

  #criacao de bibliotecarios
  get 'admin/librarier/new', to: 'librariers#new'
  post 'admin/librarier/new', to: 'librariers#create'
  get 'admin/librarier/index', to: 'librariers#index'

  #criacao de emprestimos
  get 'librarier/loan/new', to: 'loans#new'
  post 'librarier/loan/new', to: 'loans#create'
  get 'librarier/loan/index', to: 'loans#index'

  #crud de livros
  get 'librarier/book/new', to: 'books#new'
  post 'librarier/book/new', to: 'books#create'
  get 'librarier/book/index', to: 'books#index'

  #crud de alunos
  get 'librarier/student/new', to: 'students#new'
  post 'librarier/student/create', to: 'students#create'
  get 'librarier/student/index', to: 'students#index'

  get 'librarier/devolution', to: 'devolutions#new'
  post 'librarier/devolution', to: 'devolutions#create'
  
  #autenticacao de bibliotecarios
  get    '/librarier/session',   to: 'sessions#librariers'
  post   '/librarier/session',   to: 'sessions#login'
  delete '/finish', to: 'sessions#finish'

  #autenticacao de admins
  get    '/admin/session',   to: 'sessions#admins'
  post   '/admin/session',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
    
  #acesso a dashboard
  get 'librarier/dashboard', to: 'librariers#dashboard'
  get 'librarier/books/avaliable', to: 'books#avaliable'
  get 'librarier/books/borrowed', to: 'books#borrowed'

  mount ActionCable.server => "/cable"


end
