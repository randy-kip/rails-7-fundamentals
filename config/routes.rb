Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :wiki_posts

  # get 'example', to: 'wiki_posts#example'
  namespace :wiki_posts do
    get 'example'  
  end

  namespace :welcome do
    get 'index'
    get 'about'
  end

  get 'about', to: redirect('/welcome/about')
  # Defines the root path route ("/")
  root "welcome#index"
end
