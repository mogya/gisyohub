# frozen_string_literal: true

require 'rails_helper'

describe 'API::tweets', type: :request do
  context 'show' do
    context 'when tweet is not in db.' do
      it 'returns not found' do
        get '/api/tweets/1'
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when tweet is in db.' do
      let(:tweet) { create(:tweet) }
      it 'returns the tweet' do
        get "/api/tweets/#{tweet.id}"
        expect(response).to have_http_status(:ok)

        respond_tweet = JSON.parse(response.body)
        expect(respond_tweet['id']).to eq(tweet.tweet_id)
        expect(respond_tweet['text']).to eq(tweet.text)
        expect(respond_tweet['user']['screen_name']).to eq(
          tweet.twitter_user.screen_name
        )
        expect(respond_tweet).not_to have_key('raw')
      end
    end
  end
end
