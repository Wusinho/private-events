# frozen_string_literal: true

Rails.application.routes.draw do
  resources :events
  resources :users
  resources :attendances

  get 'attendances/create'
  get 'sign_in', to: 'users#sign_in'
  post 'sign_in', to: 'users#sign_in_new'
  get 'sign_out', to: 'users#sign_out'
  post 'sign_in', to: 'events#enroll'

  root 'events#index'
end
