resources :categories, except: [:show]
resources :sub_categories, except: [:show]
resources :products, except: [:show]
get '/', to: 'home#index'