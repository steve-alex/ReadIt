Rails.application.routes.draw do
  resources :users, except: [:destroy]#, except: [:index]
  resources :reviews, except: [:index]
  resources :reading_lists, include: [:index, :show, :edit, :update]
  post 'books/search', to: 'books#search', as: 'search_books'
  resources :books, include: [:index, :show]
  resources :sessions, include: [:new, :create, :destroy]
  delete "/sessions", to: "sessions#destroy"
  delete "users", to: "users#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
