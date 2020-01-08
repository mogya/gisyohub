# frozen_string_literal: true

class TwitterUser < ApplicationRecord
  # store twitter user from twitter api response
  def self.store(user_object)
    unless user_object.screen_name
      raise ArgumentError, 'content should be a Twitter::User of twitter gem.'
    end
    return if exists?(twitter_user_id: user_object.id)

    create { |record| record.attrs = user_object }
  end

  def attrs=(attrs)
    self.twitter_user_id = attrs.id
    keys = %i[name screen_name location description url profile_image_url]
    keys.each { |key| self[key] = attrs[key] }
    self.row = attrs.to_json
  end
end
