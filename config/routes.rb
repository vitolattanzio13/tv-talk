Rails.application.routes.draw do
  # get 'friends/show'
  devise_for :users
  root to: "posts#index"

  get "profile/:id", to: "pages#profile"
  get "friends", to: "friends#index"
  get "about", to: "pages#about"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/search/:query', to: 'pages#search_query'
      post '/like/', to: 'pages#like'
      post '/followm/', to: 'follows#follow_movie'
      post '/followu/', to: 'follows#follow_user'
      get '/movies/:query', to: 'movies#search'
      post '/post/', to: 'posts#create'
    end
  end

  get "chatrooms/:id", to: "chat_rooms#show", as: :chatroom
  post "/chatrooms/:id/post/", to: "posts#create", as: :chat_room_posts

  # resources :chat_rooms, only: %i[] do
  #   resources :posts, only: %i[create]
  # end
  resources :messages, only: %i[create]
  resources :movies, only: %i[index show]
  resources :posts, only: %i[index show edit update] do
    resources :replies, only: %i[new create destroy]
  end
end
