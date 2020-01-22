# Twitter tweet class
class Tweet < ApplicationRecord
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
    self.text = attrs.text

    self.row = attrs.to_json
  end
end
