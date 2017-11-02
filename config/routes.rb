Rails.application.routes.draw do
  resources :posts
  resources :topics

  get 'about' => 'welcome#about'
  
  get 'welcome/faq'
  
  get 'welcome/contact'

  root 'welcome#index'
end
