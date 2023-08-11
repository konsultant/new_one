Rails.application.routes.draw do

  get 'responses/index'
  get 'responses/new'
  get 'responses/edit'
  get 'responses/show'
  get 'responses/create'
 # get 'vacancy/new'
 # get 'vacancy/create'
 # get 'vacancy/update'
 # get 'vacancy/edit'
 # get 'vacancy/destroy'
 # get 'vacancy/index'
 # get 'vacancy/show'

 # get 'notes/new'
 # get 'notes/create'
 # get 'notes/update'
 # get 'notes/edit'
 # get 'notes/destroy'
 # get 'notes/index'
 # get 'notes/show'

 # get 'tags/new'
 # get 'tags/create'
 # get 'tags/update'
 # get 'tags/edit'
 # get 'tags/destroy'
 # get 'tags/index'
 # get 'tags/show'

 # get 'projects/new'
 # get 'projects/create'
 # get 'projects/update'
 # get 'projects/edit'
 # get 'projects/destroy'
 # get "projects/index"

  devise_for :users do 
    get "/users/sing_out" => "device/sessions#destroy"
  end
 
  root "articles#index"
  
  get "/", to: "articles#index"
  get "/users", to: "users#index" 
  get "/projects", to: "projects#index"
  get "/notes", to: "notes#index"
  get "/vacancies", to: "vacancies#index"
  get "/profiles", to: "profiles#index"
  get "/customer", to: "customer#index"
  get "/executor", to: "executor#index"


  resources :articles
  resources :projects do
    post :publish
    post :withdraw_from_publication
    post :get_respond
    post :select
    post :execute
  end
  resources :notes
  resources :tags
  resources :vacancies

   

end
