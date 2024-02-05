Rails.application.routes.draw do

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'responses/index'
  get 'responses/new'
  get 'responses/edit'
  get 'responses/show'
  get 'responses/create'

  devise_for :users do 
    get "/users/sing_out" => "device/sessions#destroy"
    get "/users/sing_in" => "devise/registrations#create"
  end
 
  root "articles#index"
  
  get "/", to: "articles#index"
  get "/users", to: "users#index" 
  get "/projects", to: "projects#index"
  get "/notes", to: "notes#index"
  get "/vacancies", to: "vacancies#index"
  get "/profiles", to: "profiles#index"
  get "/profiles/show/:id", to: "profiles#show", as: 'profile'
  get "/customer", to: "customer#index"
  get "/executor", to: "executor#index"

  post "/profiles", to: "profiles#index"

  resources :articles

  resources :projects do
    post :publish
    post :withdraw_from_publication
    post :get_respond
    post :select
    post :execute
    post :submit_for_inspection
    post :complete
  end



  resources :notes
  resources :tags
  resources :vacancies
  resources :responses
   

end
