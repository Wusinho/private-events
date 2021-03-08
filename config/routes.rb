Rails.application.routes.draw do

  resources :events
get "sign_up", to: "registrations#new"
post "sign_up", to: "registrations#create"

root "events#index"



end
