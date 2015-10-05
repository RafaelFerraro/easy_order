resources :categories, except: [:show]
resources :sub_categories, except: [:show]
get '/', to: 'home#index'