Rails.application.routes.draw do

get "sign_up", to: "registrations#new"
post "sign_up", to: "registrations#create"





end
