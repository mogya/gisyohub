# frozen_string_literal: true

require 'twitter_client_factory'

namespace :twitter do
  desc 'call twitter api and store tweets'
  task scrape: :environment do
    TwitterScrapeJobs::Search.new('#技術書典').perform_now
    TwitterScrapeJobs::Search.new('#技術書典8').perform_now
    TwitterScrapeJobs::Search.new('#技術書典7').perform_now
    TwitterScrapeJobs::Search.new('#技書博').perform_now
  end

  desc 'store favorited tweets'
  task scrape_favorited: :environment do
    TwitterScrapeJobs::Favorites.perform_now
  end

  desc 're-download all tweets'
  task refresh: :environment do
    @client = TwitterClientFactory.new_client
    Tweet.all.each do |tweet|
      status = @client.status(tweet.tweet_id)
      Tweet.store(status)
      sleep(1) # Tweet.store rate limit= 900/15min = 60/min = 1/sec.
    end
  end

  if Rails.env.development?
    desc '[DANGER] delete all tweets'
    task delete_all_tweet_this_is_danger_method: :environment do
      Tweet.all.each(&:destroy)
      JobLog.where("job_type like 'TwitterScrapeJobs::%'").each(&:destroy)
    end
  end
end
