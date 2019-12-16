Rails.application.routes.draw do
  resources :external_links_lists
  resources :tags
  resources :songs
  resources :artists
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
