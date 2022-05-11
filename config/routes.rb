Rails.application.routes.draw do
get '/', to: 'welcome#index'
get '/schools', to: 'schools#index'
get '/schools/new', to: 'schools#new'
post '/schools', to: 'schools#create'
end
