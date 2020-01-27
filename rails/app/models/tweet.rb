# frozen_string_literal: true

# Twitter tweet class
class Tweet < ApplicationRecord
  belongs_to :twitter_user,
             primary_key: 'twitter_user_id',
             foreign_key: 'user_id'

  # store tweet from twitter api response
  def self.store(tweet_object)
    unless tweet_object.text && tweet_object.user
      raise ArgumentError, 'content should be a Twitter::Tweet of twitter gem.'
    end
    return if exists?(tweet_id: tweet_object.id)

    create do |record|
      record.attrs = tweet_object
    end
  end

  def attrs=(attrs)
    self.tweet_id = attrs.id
    self.user_id = attrs.user.id
    self.tweeted_at = attrs.created_at
    keys = %i[text]
    keys.each { |key| self[key] = attrs.send(key) }

    self.row = attrs.to_json
  end
end
