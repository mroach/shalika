Rails.application.routes.draw do
  resources :articles

  root 'home#index'

  namespace :contact do
    root to: 'enquiries#new'
    post 'enquiries' => 'enquiries#create'
  end

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

  namespace :cms, path: '/' do
    get '/:format' => 'content#show', :as => 'show_page', :path => "(*cms_path)"
  end

end
