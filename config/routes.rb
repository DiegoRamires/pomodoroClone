Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'home#index'
  
  resources :todo_lists
  resources :task
  resources :home, only: [:index]
  resources :stopwatch, only: [:create, :update, :show]
end
