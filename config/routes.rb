Rails.application.routes.draw do
  resources :users, except: [:destroy]#, except: [:index]
  resources :reviews, except: [:index]
  resources :reading_lists, include: [:index, :show, :edit, :update]

  post 'books', to: 'books#search', as: 'search_books'
  post 'books/select', to: 'books#select', as: 'select_book'
  get 'books/:id', to: 'books#show', as: 'book'
  resources :books, include: [:index]
  resources :sessions, include: [:new, :create, :destroy]
  delete "sessions", to: "sessions#destroy"
  delete "users", to: "users#destroy"
  post "books/create", to: "books#create", as: "add_book"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
