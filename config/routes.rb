Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :client do
    get '/buttons' => 'buttons#index'
    get '/buttons/new' => 'buttons#new'
    get '/buttons/:id' => 'buttons#show'
    post '/buttons' => 'buttons#create'
    get '/buttons/:id/edit' => 'buttons#edit'
    patch '/buttons/:id' => 'buttons#update'
    delete '/buttons/:id' => 'buttons#destroy'
  end
end
