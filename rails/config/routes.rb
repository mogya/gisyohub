# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#show'
  get '/sessions/new', to: 'sessions#new'
  get '/sessions/', to: 'sessions#index'
  # we cannot use "resources session" to map /sessions/destroy without id...
  post '/sessions/destroy', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'

  mount SwaggerUiEngine::Engine, at: '/'
  mount V1::Root => '/api/v1'
end
