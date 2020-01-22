# frozen_string_literal: true

require 'twitter_client_factory'

module TwitterScrapeJobs
  # scrape tweets about "#技術書典" and store them.
  class SearchGijyutsushoten < Base
    def scrape
      params = {}
      params[:last_since_id] = @last_log.variables[:since_id] if @last_log
      @client.search('#技術書典', params)
    end
  end
end
