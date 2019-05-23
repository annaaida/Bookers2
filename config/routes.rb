Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :books

  resources :users

  root :to => 'books#top'

  get "/" => "books#top"

  get "/home/about" => "books#about", as: 'about'

end
