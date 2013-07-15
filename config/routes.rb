TaskApp::Application.routes.draw do
  
  resources :tasks
  resources :comments
  match "/show" => "tasks#show"
  root :to => "tasks#index"
end
