Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' } #look at the registration controller for signing up / updating acct
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do #get all resource routes for posts (autocreates routes for us)
    resources :comments
  end
  root 'posts#index' #this is the root index of our website
end
