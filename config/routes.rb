Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dishes#index"
  resources :dishes, only: [:index, :new, :create]

  post 'dishes/upload_csv', to: 'dishes#upload_csv'

end
