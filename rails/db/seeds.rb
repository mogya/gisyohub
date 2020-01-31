# frozen_string_literal: true

admin_user =
  User.find_or_create_by!(email: 'mogya+gisyohub@mogya.com') do |record|
    record.provider = 'twitter'
    record.uid = '1194412802389110784'
    record.user_name = 'gisyohub 技術同人誌のための情報サイト'
    record.image_url = 'http://abs.twimg.com/sticky/default_profile_images/default_profile_normal.png'
    record.email = 'mogya+gisyohub@mogya.com'
    record.access_token = ENV['TWITTER_ACCESS_TOKEN']
    record.access_secret = ENV['TWITTER_ACCESS_SECRET']
  end
Worker.find_or_create_by!(user: admin_user)

bot_user =
  User.find_or_create_by!(email: 'mogya+gisyohub_bot@mogya.com') do |record|
    record.provider = ''
    record.uid = '0'
    record.user_name = 'gisyohub bot'
    record.image_url = ''
    record.email = 'mogya+gisyohub_bot@mogya.com'
    record.access_token = ''
    record.access_secret = ''
  end
Worker.find_or_create_by!(user: bot_user)
