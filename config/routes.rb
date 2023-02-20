Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

root to: 'pages#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
  get 'login', to: 'devise/sessions#new'
end
devise_scope :user do
  get 'signup', to: 'devise/registrations#new'
end
resources :posts do
  collection do
    get 'hobby'
    get 'study'
    get 'team'
  end
end

resources :contacts, only: [:create, :update, :destroy]

namespace :private do 
  resources :conversations, only: [:create] do
    member do
      post :close
      post :open
    end
  end
  resources :messages, only: [:index, :create]
end



namespace :group do 
  resources :conversations do
    member do
      post :close
      post :open
    end
  end
  resources :messages, only: [:index, :create]
end

end
