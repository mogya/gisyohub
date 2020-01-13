require 'twitter_client_factory'

class TwitterScrapeFavoritesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @last_log = JobLog.where(job_type: self.class.name).order(finished_at: 'DESC').first
    @current_log = JobLog.create(job_type: self.class.name, started_at: Time.zone.now)

    @user = User.find_by(uid: '1194412802389110784')
    unless @user
      logger.error('TwitterScrapeFavoritesJob: gisyohub user not found')
      raise 'TwitterScrapeFavoritesJob: gisyohub user not found'
    end

    @client = TwitterClientFactory.new_client(@user)
    params = {}
    params[:last_since_id] = @last_log.variables[:since_id] if @last_log
    favorites = @client.favorites(params)
    logger.info("TwitterScrapeFavoritesJob: found #{favorites.count} tweets.")

    favorites.each do |tweet|
      logger.debug("TwitterScrapeFavoritesJob: #{tweet.id} #{tweet.created_at}")
      Tweet.store(tweet)
    end

    @current_log.variables[:since_id] = favorites.first&.id || params[:last_since_id]
    @current_log.finished_at = Time.zone.now
    @current_log.save
  end
end
