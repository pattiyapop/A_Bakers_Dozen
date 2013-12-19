ABakersDozen::Application.routes.draw do
  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/followed_recipes"

  #root :to => 'recipes#index'
  resources :recipes
  root :to => redirect('/recipes')
  get "recipes/new"

  #resources :users
  #GET	/users/1/following	following	following_user_path(1)
  #GET	/users/1/followers	followers	followers_user_path(1)
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
  match '/signout', to: 'sessions#destroy'#,     via: 'delete' #commented out to fix heroku

  resources :users, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  #comments don't need a 'new' or 'edit' method:
  resources :comments, only: [:new, :create, :destroy]
end
