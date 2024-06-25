Rails.application.routes.draw do
  
  devise_for :users 
  resources :users, only: [:edit, :show, :index, :update]
  
  resources :books, only: [:new, :index, :show, :edit, :create, :destroy, :update]

  

  root to: 'homes#top'
  
  get 'homes/top' => 'homes#top'
  get 'homes/about' => "homes#about", as: 'about'
  
end

