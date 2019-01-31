Rails.application.routes.draw do
  get 'dashboard/student'
  get 'dashboard/instructor'
  get 'dashboard/admin'
  resources :test_details
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

  resources :subjects
  resources :instructors
  resources :students do 
    collection { post :import}
  end
  resources :users
  get 'demo/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
