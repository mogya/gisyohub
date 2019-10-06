# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#show'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
end
