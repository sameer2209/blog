Rails.application.routes.draw do
  devise_for :users
  # get 'articles/index'
  # get 'articles/show'
  # get 'articles/new'
  # get 'articles/edit'
  # get 'articles/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'pages#index'
 
 get 'about', to: 'pages#about'

 resources :articles
  
end
