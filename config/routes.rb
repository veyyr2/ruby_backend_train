Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"



  # если пользователь отправил форму с запросом POST, то создаётся в экшене изменение данных в БД
  # что в свою очередь в create отправляет на страницу create.html.erb
  # post '/questions', to: 'questions#create'

  # если пользователь изменил вопрос
  # patch '/questions/:id', to: 'questions#update'

  # если пользователь удалил вопрос
  # delete '/questions/:id', to: 'questions#destroy'

  # записать всё одной строкой с дополнением 
  resources :questions
end
