Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root :to => 'home#top'
  # get 'home/top'
  devise_for :foreign_users
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :only => [:index,:show, :edit, :update]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

end
