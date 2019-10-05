# frozen_string_literal: true

FactoryBot.define do
  factory :webpage do
    request_uri { 'MyString' }
    base_uri { 'MyString' }
    charset { 'MyString' }
    content_encoding { 'MyString' }
    content_type { 'MyString' }
    last_modified { '2019-09-11 07:34:50' }
    accessed_at { '2019-09-11 07:34:50' }
    content { 'MyText' }
  end
end
