Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  get "profile/:id", to: "pages#profile"


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/search/:query', to: 'pages#search_query'
      post '/like/', to: 'pages#like'
      post '/followm/', to: 'follows#follow_movie'
      get '/movies/:query', to: 'movies#search'
      post '/post/', to: 'posts#create'
    end
  end

  get "chatrooms/:id", to: "chat_rooms#show", as: :chatroom
  post "/chatrooms/:id/post/", to: "posts#create", as: :chat_room_posts

  # resources :chat_rooms, only: %i[] do
  #   resources :posts, only: %i[create]
  # end
  resources :movies, only: %i[index show]
  resources :posts, only: %i[index show edit update] do
    resources :replies, only: %i[new create destroy]
  end
end
