# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    get 'tweets/index'
    get 'tweets/:tweet_id', to: 'tweets#show'
  end
  root 'sessions#show'
  get '/sessions/new', to: 'sessions#new'
  get '/sessions/', to: 'sessions#index'
  # we cannot use "resources session" to map /sessions/destroy without id...
  post '/sessions/destroy', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
end
