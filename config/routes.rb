Rails.application.routes.draw do
  get 'top' => 'homes#top'
  post 'books' => 'books#create'
  get 'books/:id' => 'books#show', as: 'book'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
