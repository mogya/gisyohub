# frozen_string_literal: true

module Api
  class TweetsController < BaseController
    def index; end

    def show
      @tweet = Tweet.find_by(tweet_id: params[:tweet_id])
      if @tweet
        render json: {
          id: @tweet.tweet_id,
          id_str: @tweet.tweet_id.to_s,
          user: {
            id: @tweet.twitter_user.twitter_user_id,
            id_str: @tweet.twitter_user.twitter_user_id.to_s,
            name: @tweet.twitter_user.name,
            screen_name: @tweet.twitter_user.screen_name,
            description: @tweet.twitter_user.description,
            url: @tweet.twitter_user.url,
            profile_image_url: @tweet.twitter_user.profile_image_url
          },
          text: @tweet.text,
          tweeted_at: @tweet.tweeted_at
        }
      else
        head :not_found
      end
    end
  end
end
