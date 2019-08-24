Rails.application.routes.draw do
  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
                                      
  get 'notifications', to: 'notifications#index'

  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' } #look at the registration controller for signing up / updating acct
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do #get all resource routes for posts (autocreates routes for us)
    resources :comments
    member do
      get 'like'
    end
  end
  get ':user_name', to: 'profiles#show', as: :profile #GETting a route use the show action, refer to route as profile route
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile #GETing a route, use the edit action, refer to route as edit profile route
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile #PATCH route for the edit url when calling action update
  root 'posts#index' #this is the root index of our website
end




#routes.rb handles routes or urls to get certain paths in your site

