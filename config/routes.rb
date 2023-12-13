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

  namespace :api do
    namespace :v1 do
      get 'wiki_posts/xml', to: 'wiki_posts#xml_index'
      get 'wiki_posts/csv', to: 'wiki_posts#csv_index'
      resources :wiki_posts
    end
    namespace :v2 do
      resources :wiki_posts
    end
  end

  get 'about', to: redirect('/welcome/about')
  # Defines the root path route ("/")
  root "welcome#index"
end
