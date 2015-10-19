# it can be accessing throught routes.path(:root) or routes.url(:root) or routes.root_path or routes.root_url
get '/', to: 'home#index', as: :root
post '/products/search', to: 'products#search', as: :search