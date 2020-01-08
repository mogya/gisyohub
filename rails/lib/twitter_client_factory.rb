# frozen_string_literal: true

# get Twitter API client. use user's access token or default ENV parameter.
class TwitterClientFactory
  def self.new_client(user = nil)
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = user&.access_token || ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret =
        user&.access_secret || ENV['TWITTER_ACCESS_SECRET']
    end
  end
end

=begin
require 'twitter_client_factory'
client = TwitterClientFactory.new_client
client.search("#ruby -rt", lang: "ja").first.text
=> "今はCloud9を使ってるからだいぶマシになったけど..."
=end
