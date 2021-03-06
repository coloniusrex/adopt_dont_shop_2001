Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'shelters#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/pets', to: 'pets#index'
  # get '/pets/new', to: 'pets#new'
  # post '/pets', :to 'pets#create'

  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/pets', to: 'shelters#show_pets'
  get '/shelters/:id/pets/new', to: 'pets#new'
  post '/shelters/:id/pets', to: 'pets#create'
  get '/pets/:id', to: 'pets#show'

  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id/', to: 'pets#update'

  delete '/shelters/:id', to: 'shelters#destroy'
  delete '/pets/:id', to: 'pets#destroy'

  patch '/pets/:id/adoptable', to: 'pets#adoptable'
  patch '/pets/:id/pending', to: 'pets#pending'
end
