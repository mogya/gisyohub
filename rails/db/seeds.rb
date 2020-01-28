# frozen_string_literal: true

unless admin_user = User.find_by(email: 'mogya+gisyohub@mogya.com')
  admin_user = User.create(
    provider: 'twitter',
    uid: '1194412802389110784',
    user_name: 'gisyohub 技術同人誌のための情報サイト',
    image_url: 'http://abs.twimg.com/sticky/default_profile_images/default_profile_normal.png',
    email: 'mogya+gisyohub@mogya.com',
    access_token: ENV['TWITTER_ACCESS_TOKEN'],
    access_secret: ENV['TWITTER_ACCESS_SECRET']
  )
end

unless Worker.find_by(user: admin_user)
  Worker.create(
    user: admin_user
  )
end
