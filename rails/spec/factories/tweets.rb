# frozen_string_literal: true

FactoryBot.define do
  factory :tweet do
    tweet_id { 1 }
    user_id { 1 }
    text { 'MyString' }
    row { 'MyText' }
  end

  factory :twitter_tweet_response, class: OpenStruct do
    initialize_with do
      json = <<-'END_OF_JSON'
        {"created_at":"Tue Jan 07 23:54:30 +0000 2020","id":1214696844455895040,"id_str":"1214696844455895040","text":"新型Nintendo Switch、2020年半ばに発売のうわさ https://t.co/0nSOgExXJD via @engadgetjp\n\n#java #javascript #C #PHP #Python #Ruby… https://t.co/Bgo9eJDLxV","truncated":true,"entities":{"hashtags":[{"text":"java","indices":[74,79]},{"text":"javascript","indices":[80,91]},{"text":"C","indices":[92,94]},{"text":"PHP","indices":[95,99]},{"text":"Python","indices":[100,107]},{"text":"Ruby","indices":[108,113]}],"symbols":[],"user_mentions":[{"screen_name":"engadgetjp","name":"Engadget 日本版","id":87211271,"id_str":"87211271","indices":[61,72]}],"urls":[{"url":"https://t.co/0nSOgExXJD","expanded_url":"https://japanese.engadget.com/jp-2020-01-06-nintendo-switch-2020.html","display_url":"japanese.engadget.com/jp-2020-01-06-…","indices":[33,56]},{"url":"https://t.co/Bgo9eJDLxV","expanded_url":"https://twitter.com/i/web/status/1214696844455895040","display_url":"twitter.com/i/web/status/1…","indices":[115,138]}]},"metadata":{"iso_language_code":"ja","result_type":"recent"},"source":"\u003ca href=\"http://twitter.com\" rel=\"nofollow\"\u003eTwitter Web Client\u003c/a\u003e","in_reply_to_status_id":null,"in_reply_to_status_id_str":null,"in_reply_to_user_id":null,"in_reply_to_user_id_str":null,"in_reply_to_screen_name":null,"user":{"id":1177057067011432448,"id_str":"1177057067011432448","name":"国友@SEキャリアアップ支援","screen_name":"K1pmimrN31IGd9X","location":"","description":"システムエンジニアさんに対するキャリアアップ支援をしています😉","url":null,"entities":{"description":{"urls":[]}},"protected":false,"followers_count":108,"friends_count":210,"listed_count":0,"created_at":"Thu Sep 26 03:07:39 +0000 2019","favourites_count":25,"utc_offset":null,"time_zone":null,"geo_enabled":false,"verified":false,"statuses_count":128,"lang":null,"contributors_enabled":false,"is_translator":false,"is_translation_enabled":false,"profile_background_color":"F5F8FA","profile_background_image_url":null,"profile_background_image_url_https":null,"profile_background_tile":false,"profile_image_url":"http://pbs.twimg.com/profile_images/1177059959801954304/2OyelLhe_normal.jpg","profile_image_url_https":"https://pbs.twimg.com/profile_images/1177059959801954304/2OyelLhe_normal.jpg","profile_banner_url":"https://pbs.twimg.com/profile_banners/1177057067011432448/1569478627","profile_link_color":"1DA1F2","profile_sidebar_border_color":"C0DEED","profile_sidebar_fill_color":"DDEEF6","profile_text_color":"333333","profile_use_background_image":true,"has_extended_profile":false,"default_profile":true,"default_profile_image":false,"following":null,"follow_request_sent":null,"notifications":null,"translator_type":"none"},"geo":null,"coordinates":null,"place":null,"contributors":null,"is_quote_status":false,"retweet_count":2,"favorite_count":1,"favorited":false,"retweeted":false,"possibly_sensitive":false,"lang":"ja"}
      END_OF_JSON
      # want to access twitter_tweet_response.user.id
      new(JSON.parse(json, object_class: OpenStruct))
    end
  end
end
