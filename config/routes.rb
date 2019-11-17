Rails.application.routes.draw do
  root :to => 'home#top'
  # get 'home/top'
  devise_for :foreign_users
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :only => [:index,:show]

end
