GeneralAssembly::Application.routes.draw do
  
  resources :users

  root "static#home"
  get '/about', to: "static#about"
  get '/contact', to:"static#contact"
  get '/apply', to: 'users#new'
  get '/dashboard', to: "users#dashboard"
  

  resources :sessions
  resources :courses
  resources :students
  resources :teachers
  resources :rooms
  
  get '/schedules', to: 'schedules#index'

  get '/signup/:id', to: 'courses#sign_up'

  get '/logout', to: 'sessions#destroy'

end
