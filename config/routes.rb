Rails.application.routes.draw do
  get '/gossips/:gossip_id/like/create', to: 'like#create'
  get '/gossips/:gossip_id/like/destroy', to: 'like#destroy'
  get '/comments/:comment_id/comment/new', to: 'comments#new', as: 'new_comment_comment'
  post '/comments/:comment_id/comments', to: 'comments#create', as: 'comment_comments' 
  get 'registration/new'
  get '/logout', to: 'registration#logout'
  get '/not_connected', to: 'static_pages#not_connected'
  post 'registration/create'
  root 'static_pages#home'
  resources :users, only: [:index, :new, :create]
  resources :gossips do
    resources :comments, except: [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
