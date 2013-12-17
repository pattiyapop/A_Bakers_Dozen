ABakersDozen::Application.routes.draw do
  root :to => 'recipes#index'

  resources :comments

  resources :recipes
  root :to => redirect('/recipes')
  get "recipes/new"

  #resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  #root :to => redirect('/users')
  #get "users/new"
  
  
  match '/signup', to: 'users#new', via: 'get' #gives us signup_path
  match '/home', to: 'recipes#index'

  #signin/signout:
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  resources :users, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  #comments don't need a 'new' or 'edit' method:
  resources :comments, only: [:create, :destroy]
end
