# frozen_string_literal: true

require 'twitter_client_factory'

module TwitterScrapeJobs
  # scrape tweets about keyword and store them.
  class Search < Base
    def initialize(keyword)
      super()
      @keyword = keyword
    end

    def perform
      tweets = scrape(@keyword)
      logger.info("#{log_title}:API returns #{tweets.count} tweets.")

      count = store_tweets(tweets)
      update_job_log(tweets)

      STDOUT.puts("#{log_title}:done. #{count} tweets stored.")
    end

    private

    def scrape(keyword)
      params = { tweet_mode: 'extended' }
      params[:last_since_id] = @last_log.variables[:since_id] if @last_log
      @client.search(keyword, params)
    end

    def log_title
      "#{self.class.name}(#{@keyword})"
    end
  end
end
