# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    provider { 'twitter' }
    uid { '123456' }
    user_name { 'MyString' }
    image_url { '' }
    email { 'mogya@example.com' }
    access_token { 'xxx' }
    access_secret { 'xxx' }
  end
end
