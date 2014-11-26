Rails.application.routes.draw do
  resources :articles

  root 'home#index'

  namespace :blog do
    root to: 'articles#index'
    resources :articles, only: [:show, :index]
  end

  namespace :admin do
    root to: 'home#index'

    namespace :blog do
      root to: 'articles#index'
      resources :articles
      post 'articles/preview' => 'articles#preview'
    end

    namespace :cms do
      root to: 'pages#index'
      resources :pages
      post 'pages/preview' => 'pages#preview'
    end
  end

end
