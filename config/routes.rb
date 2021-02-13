Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  
  resources :group_events
  
end
