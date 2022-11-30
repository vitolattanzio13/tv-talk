Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "movies/:id/chatrooms/:id", to: "chat_rooms#show"
  get "profile/:id", to: "pages#profile"
  get "pages/", to: "pages#search_query"

  resources :movies, only: %i[index show]
  resources :posts, only: %i[index show new create edit update] do
    resources :replies, only: %i[new create destroy]
  end
end
