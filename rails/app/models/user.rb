# frozen_string_literal: true

# User model for author,reader(both use this class at this time.)
class User < ApplicationRecord
  # create or get user from omniauth twitter login response.
  def self.find_or_create_from_auth(auth)
    info = auth[:info]
    credentials = auth[:credentials]

    find_or_create_by(provider: auth[:provider], uid: auth[:uid]) do |user|
      user.user_name = info[:name]
      user.image_url = info[:image]
      user.email = info[:email]
      user.access_token = credentials[:token]
      user.access_secret = credentials[:secret]
      user.raw_auth = auth.to_json
    end
  end
end
