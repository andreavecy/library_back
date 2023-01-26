Rails.application.routes.draw do
  resources :favorite_books
  resources :lends
  resources :books
  resources :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users, skip: %i[registrations sessions passwords]
  devise_scope :user do
    post '/signup', to: 'registrations#create'
    post '/update/:id', to: 'registrations#update_user'
    post '/login', to: 'sessions#create'
    get '/current_user/:id', to: 'sessions#get_user'
    delete '/logout', to: 'sessions#destroy'
    post '/find_user', to: 'sessions#find_user'
  end

  get 'books_authors', to: 'books#books_authors'

end
