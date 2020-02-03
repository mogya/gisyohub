# frozen_string_literal: true

FactoryBot.define do
  factory :twitter_user do
    twitter_user_id { 1 }
    name { 'MyString' }
    screen_name { 'MyString' }
    location { 'MyString' }
    description { 'MyText' }
    url { 'MyString' }
    profile_image_url { 'MyText' }
    raw { '{}' }
  end
end
