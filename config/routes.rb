Rails.application.routes.draw do
  resources :subject_classes
  resources :subjects
  resources :instructors
  resources :students do 
    collection { post :import}
  end
  resources :users
  get 'demo/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
