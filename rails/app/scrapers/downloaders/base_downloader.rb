# frozen_string_literal: true

class BaseDownloader
  attr_accessor :user_agent
  DEFAULT_USER_AGENT = 'mogya scraper. contact me at mogya@mogya.com if any problem.'

  def initialize
    @user_agent = DEFAULT_USER_AGENT
  end

  def get(uri); end

  def get(uri); end
end
