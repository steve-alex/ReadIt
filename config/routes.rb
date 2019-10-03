Rails.application.routes.draw do

  resources :reviews, only: [:update]

  get "books/:id/new_review", to: "reviews#new", as: "new_review"
  get "reviews/:id/edit", to: "reviews#edit", as: "edit_review"
  post "reviews", to: "reviews#create"
  delete "books/:id", to: "reviews#destroy", as: "delete_review"

  resources :reading_lists, include: [:index, :show] #:edit, :update ??

  resources :users, except: [:destroy]
  delete "users", to: "users#destroy"
  
  get 'books/:id', to: 'books#show', as: 'book'
  get 'books', to: 'books#index', as: 'books' #to delete!!!
  #below route to show all reviews of a book (no method in controller or view page)
  #get "books/:id/reviews", to: "books#reviews", as: "book_reviews"
  post 'books', to: 'books#search', as: 'search_books'
  post 'books/select', to: 'books#select', as: 'select_book'
  post "books/archivebook", to: "books#archivebook", as: "add_book"
 

  get "sessions/new", to: "sessions#new", as: "new_session"
  post 'sessions', to: "sessions#create"
  delete "sessions", to: "sessions#destroy"
  
end
