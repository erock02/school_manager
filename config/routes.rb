Rails.application.routes.draw do
get '/', to: 'welcome#index'
get '/schools', to: 'schools#index'
get '/schools/new', to: 'schools#new'
post '/schools', to: 'schools#create'
get '/schools/:id', to: "schools#show"
get '/students', to: 'students#index'
get '/students/:id', to: "students#show"
end
