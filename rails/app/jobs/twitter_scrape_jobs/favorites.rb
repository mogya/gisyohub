# frozen_string_literal: true

require 'twitter_client_factory'

module TwitterScrapeJobs
  # scrape favorited tweets and store them.
  class Favorites < Base
    def initialize
      super
      @client = twitter_client_of_service_owner
    end

    def scrape
      params = {tweet_mode: "extended"}
      params[:last_since_id] = @last_log.variables[:since_id] if @last_log
      @client.favorites(params)
    end

    private

    def twitter_client_of_service_owner
      user = User.find_by(uid: '1194412802389110784')
      raise 'TwitterScrapeFavoritesJob: gisyohub user not found' unless user

      TwitterClientFactory.new_client(user)
    end
  end
end
