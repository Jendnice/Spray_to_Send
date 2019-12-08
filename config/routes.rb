Rails.application.routes.draw do
  
  resources :locations
  resources :climbs
  resources :reviews
  
  root to: 'application#welcome'

  devise_for :users, :controllers => {registrations: 'registrations'}

end
