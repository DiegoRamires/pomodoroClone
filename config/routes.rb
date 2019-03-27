Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :todo_lists
end
