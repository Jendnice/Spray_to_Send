Rails.application.routes.draw do

  resources :reviews
  resources :climbs do
    resources :reviews, only: [:new, :index]
  end 

  resources :locations
  devise_for :users, :controllers => {registrations: 'registrations'}
  root to: 'application#welcome'

end


#  get 'climbs/grouped_ratings', to: 'climbs#ratings'

