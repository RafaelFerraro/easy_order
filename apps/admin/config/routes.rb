resources :categories, except: [:show]
resources :sub_categories, except: [:show]
resources :products, except: [:show] do
  resources :photos, except: [:show, :edit, :update]
end
get '/', to: 'home#index'