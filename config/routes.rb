Rails.application.routes.draw do
    resources :questions
    resources :advertisements

    resources :topics do
    # #34
        resources :posts, except: [:index]
        resources :sponsored_posts, except: [:index]
    end

    resources :users, only: [:new, :create]
    
    post 'users/confirm'
    post 'users/new'

    get 'about' => 'welcome#about'

    get 'welcome/faq'

    get 'welcome/contact'

    root 'welcome#index'
end
