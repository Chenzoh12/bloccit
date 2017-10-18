Rails.application.routes.draw do
  resources :posts
  
  resources :advertisements
  
  get 'about' => 'welcome#about'
  
  get 'welcome/faq'
  
  get 'welcome/contact'

  root 'welcome#index'
end
