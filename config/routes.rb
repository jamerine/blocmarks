Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show
  ]
  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:index, :create, :destroy]
    end
  end

  post :incoming, to: 'incoming#create'

end
