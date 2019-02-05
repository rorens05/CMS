Rails.application.routes.draw do

  get 'profile/index'
  root 'dashboard#admin'
  get 'dashboard/student'
  get 'dashboard/class_information'
  get 'dashboard/classes'
  get 'dashboard/test_dashboard'
  get 'dashboard/instructor'
  get 'dashboard/admin'
  get 'instructors/classes', to: 'instructors#show'
  get 'user_authentication/login'
  post 'user_authentication/attempt_login'
  delete 'user_authentication/logout'

  resources :tests do
    get :edit_students_scores, on: :member
    post :update_students_scores, on: :member
  end

  resources :attendances do
    post :new_attendance, on: :member
  end

  resources :subject_classes do
    post :add_student, on: :member
    post :remove_student, on: :member
    get :attendances, on: :member
  end

  resources :students do 
    collection { post :import}
  end

  resources :test_details
  resources :subjects
  resources :instructors
  resources :users
  get 'demo/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
