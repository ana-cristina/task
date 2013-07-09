TaskApp::Application.routes.draw do
  
  resources :tasks
  root :to => "tasks#index"
  match "show" => "tasks#show"
end
