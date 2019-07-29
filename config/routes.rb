Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts #get all resource routes for posts (autocreates routes for us)
  root 'posts#index' #this is the root index of our website
end
