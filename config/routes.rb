Rails.application.routes.draw do

  resources :librariers
  resources :books
  resources :students
  resources :admins
  resources :loans
  resources :devolutions
  
  root 'home#index'

  #criacao de bibliotecarios
  get '/registration', to: 'librariers#new'
  post '/registration', to: 'librariers#create'
  get '/librariers', to: 'librariers#index'

  #criacao de emprestimos
  get '/emprestimo', to: 'loans#new'
  post '/emprestimo', to: 'loans#create'
  get '/emprestimos', to: 'loans#index'

  get '/devolucao', to: 'devolutions#new'
  post '/devolucao', to: 'devolutions#create'
  
  #autenticacao de bibliotecarios
  get    '/lib',   to: 'sessions#librariers'
  post   '/lib',   to: 'sessions#login'
  delete '/finish', to: 'sessions#finish'
  #delete '/librariers',  to: 'sessions#destroy'

  #crud de livros
  get '/livro', to: 'books#new'
  post '/livro', to: 'books#create'
  get '/books', to: 'books#index'

  #crud de alunos
  get '/aluno', to: 'students#new'
  post '/students', to: 'students#create'
  get '/students', to: 'students#index'

  get '/admin', to: 'admins#new'
  post '/admin', to: 'admins#create'

  get '/admins', to: 'admins#index'

  #autenticacao de admins
  get    '/adm',   to: 'sessions#admins'
  post   '/adm',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  

  #resources: admins
  
  #acesso a dashboard
  get 'dashboard', to: 'librariers#dashboard'


end
