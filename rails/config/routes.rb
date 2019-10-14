# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#show'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  mount SwaggerUiEngine::Engine, at: '/'
  mount V1::Root => '/api/v1'
end
