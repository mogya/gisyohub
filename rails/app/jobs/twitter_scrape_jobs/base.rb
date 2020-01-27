# frozen_string_literal: true

require 'twitter_client_factory'

module TwitterScrapeJobs
  # base class to scrape tweets and store them.
  class Base < ApplicationJob
    queue_as :default
    def initialize
      @last_log =
        JobLog.where(job_type: self.class.name).order(finished_at: 'DESC').first
      @current_log =
        JobLog.create(job_type: self.class.name, started_at: Time.zone.now)
      @client = TwitterClientFactory.new_client
    end

    def perform(*_args)
      tweets = scrape
      logger.info("#{self.class.name}: API returns #{tweets.count} tweets.")

      count = store_tweets(tweets)
      update_job_log(tweets)

      STDOUT.puts("#{self.class.name} done. #{count} tweets stored.")
    end

    def update_job_log(tweets)
      @current_log.variables[:since_id] = tweets.first&.id
      if @current_log.variables[:since_id].nil? && @last_log
        @current_log.variables[:since_id] = @last_log.variables[:since_id]
      end
      @current_log.finish
    end

    def store_tweets(tweets)
      count = 0
      tweets.each do |tweet|
        logger.debug(
          "#{self.class.name} store a tweet: #{tweet.id} #{tweet.created_at}"
        )
        count += 1 if Tweet.store(tweet)
        TwitterUser.store(tweet.user)
      end
      logger.info("#{self.class.name} done. #{count} tweets stored.")
      count
    end
  end
end
