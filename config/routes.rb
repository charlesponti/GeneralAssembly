GeneralAssembly::Application.routes.draw do
  
  root "static#home"
  get '/about', to: "static#about"
  get '/contact', to:"static#contact"

  # Log In: get "sessions/create"
  # Log Out: get "sessions/destroy"

  resources :courses
  resources :students
  resources :teachers
  resources :rooms
  get '/schedules', to: 'schedules#index'

  get '/signup/:id', to: 'courses#signup'

end
