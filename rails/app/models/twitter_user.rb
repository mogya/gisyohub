# frozen_string_literal: true

class TwitterUser < ApplicationRecord
  # store twitter user from twitter api response
  def self.store(user_object)
    unless user_object.screen_name
      raise ArgumentError, 'content should be a Twitter::User of twitter gem.'
    end

    record = find_or_initialize_by(twitter_user_id: user_object.id)
    record.attrs = user_object
    record.save!
    record
  end

  def attrs=(attrs)
    self.twitter_user_id = attrs.id
    keys = %i[name screen_name location description url profile_image_url]
    keys.each { |key| self[key] = attrs.send(key) }
    self.raw = attrs.to_json
  end
end
