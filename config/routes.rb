Rails.application.routes.draw do

  resources :reviews, only: [:update]

  get "books/:id/new_review", to: "reviews#new", as: "new_review"
  get "books/:id/get_reviews", to: "books#reviews", as: "get_reviews"
  get "reviews/:id/edit", to: "reviews#edit", as: "edit_review"
  post "reviews", to: "reviews#create"
  delete "books/:id", to: "reviews#destroy", as: "delete_review"

  get "reading_lists/create", to: "reading_lists#create", as: "create_reading_lists"
  delete "users/:id", to: "reading_lists#destroy", as: "delete_reading_list"
  resources :reading_lists, include: [:index, :show]

  resources :users, except: [:destroy]
  delete "users", to: "users#destroy"
  get "users/:id/analytics", to: "users#analytics", as: "show_analytics"
  get "users/:id/settings", to: "users#settings", as: "settings"

  get 'books/:id', to: 'books#show', as: 'book'
  get 'books', to: 'books#index', as: 'books' #to delete!!!
  #below route to show all reviews of a book (no method in controller or view page)
  #get "books/:id/reviews", to: "books#reviews", as: "book_reviews"
  post 'books', to: 'books#search', as: 'search_books'
  post 'books/select', to: 'books#select', as: 'select_book'
  post "books/archivebook", to: "books#archivebook", as: "add_book"
  delete "books/:id/unarchive", to: "books#destroy", as: "unarchive_book"
  

  get "sessions/new", to: "sessions#new", as: "new_session"
  post 'sessions', to: "sessions#create"
  delete "sessions", to: "sessions#destroy"
  
end