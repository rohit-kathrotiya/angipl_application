Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "words#index"
  resources :words, only: [:index, :new, :create, :show]       # %i[index new create] both are same method to write
end
