Rails.application.routes.draw do
  resources :wiki_posts, only: [:index, :post, :create, :edit]
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  
  get 'wiki_posts/example', to: 'wiki_posts#exmpl'
  
  get 'welcome/about'

  get '/about', to: redirect('/welcome/about')

  # Defines the root path route ("/")
  root "welcome#index"
end
