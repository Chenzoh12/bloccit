Rails.application.routes.draw do
    resources :questions
    resources :advertisements

    resources :topics do
    # #34
        resources :posts, except: [:index]
        resources :sponsored_posts, except: [:index]
    end

    get 'about' => 'welcome#about'

    get 'welcome/faq'

    get 'welcome/contact'

    root 'welcome#index'
end
