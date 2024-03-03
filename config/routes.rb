Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :users, only: [:show] # ユーザーマイページへのルーティング
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'users/show' => 'users#show'
  get 'statics/top' => 'statics#top'
  # get 'users/:id' => 'users#show', as:'user'
  
  get 'events/new' => 'events#new'
  post 'events' => 'events#create'
  get 'events/:id' => 'events#show',as: 'event'
  patch 'events/:id' => 'events#update'
  delete 'events/:id' => 'events#destroy' 
  get 'events/:id/edit' => 'events#edit', as:'edit_event'
  # get 'users/index' => 'users#index'
  
  get 'choices/new' => 'choices#new'
  post 'choices' => 'choices#create'

  patch 'comments/:id' => 'comments#update'
  delete 'comments/:id' => 'comments#destroy' 
  get 'comments/:id/edit' => 'comments#edit', as:'edit_comment'

  get 'tweets/new' => 'tweets#new'
  # post 'tweets' => 'tweets#create'
  # get 'tweets/:id' => 'tweets#show',as: 'tweet'
  # patch 'tweets/:id' => 'tweets#update'
  # delete 'tweets/:id' => 'tweets#destroy' #こ
  # get 'tweets/:id/edit' => 'tweets#edit', as:'edit_tweet'

  # get 'groups/new' => 'groups#new'
  # get 'groups/show' => 'groups#show'

  # post 'groups' => 'groups#create'
  # get 'groups/:id' => 'groups#show',as: 'group'
  # patch 'groups/:id' => 'groups#update'
  # delete 'groups/:id' => 'groups#destroy' 
  # get 'groups/:id/edit' => 'groups#edit', as:'edit_group'

  root 'statics#top'

  resources :groups, except: [:destroy]
  resources :groups do      #ここ！
    get "join" => "groups#join"
    delete "all_destroy" => 'groups#all_destroy'
  end

  resources :events do
    resources :comments, only: [:create, :edit]
  end
  
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end

  resources :comments, only: [:destroy]
end