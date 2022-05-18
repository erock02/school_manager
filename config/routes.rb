Rails.application.routes.draw do
get '/', to: 'welcome#index'
get '/schools', to: 'schools#index'
get '/schools/new', to: 'schools#new'
post '/schools', to: 'schools#create'
get '/schools/:id', to: "schools#show"
get '/students', to: 'students#index'
get '/students/:id', to: "students#show"
get '/schools/:school_id/students', to: 'school_students#index'
get '/schools/:id/edit', to: 'schools#edit'
patch '/schools/:id', to: 'schools#update'
get '/schools/:school_id/students/new', to: 'school_students#new'
post '/schools/:school_id/students', to: 'school_students#create'
get '/students/:id/edit', to: 'students#edit'
patch '/students/:id', to: 'students#update'
delete '/schools/:id', to: 'schools#destroy'
end
