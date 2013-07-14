TaskApp::Application.routes.draw do
  
  resources :tasks
  resources :comments
  root :to => "tasks#index"
end
