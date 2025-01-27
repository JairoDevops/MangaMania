Rails.application.routes.draw do


  # GET -> list_products_path -> list_products_controller#index 
  # GET -> list_product_path -> list_products_controller#show -> :id
  # POST -> create_list_product_path -> list_products_controller#create -> product_id
  resources :list_products
  #add_to_list -> Post -> cree un nuevo ListProduct(user: current_user, product: product, carshopping: current_user.car_shopping)
 
  #list_products/add_to_list
  #mi_url_path
  #sin as: href="localhost:3000/list_products/add-to-list?product_id=1"
  #con as: add_to_list_path(product_id: @product.id)
  #to: controlador#metodo_del_controlador
  post "/add-to-list", to: "list_products#add_to_list", controller: "list_products", as: :add_to_list
  
  delete "/remove-from-cart/:id", to: "list_products#remove_from_cart", as: :remove_from_cart

  post "/shop_from_cart/", to: "list_products#shop_from_cart", as: :shop_from_cart
  
  
  #user_profile_path
  #link_to 'Mi perfil', 
  #views/users/profile.html.erb
  #get "/mi-perfil", to: "users#profile", controller: "users", as: :user_profile



  resources :editorials
  devise_for :users
  root to: "products#index"


  
  resources :carshoppings
  resources :whishlists
  resources :addres
  resources :shopingcars
  resources :whislists
  resources :products
  resources :categories
  resources :roles

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
