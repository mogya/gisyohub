# frozen_string_literal: true

FactoryBot.define do
  factory :webpage_datum, class: OpenStruct do
    skip_create
    transient do
      content { '<html></html>' }
      uri { 'https://example.com/index.html' }
    end
    base_uri { URI.parse(uri) }
    charset { 'iso-8859-1' }
    content_encoding { [] }
    content_type { 'text/html' }
    last_modified { Time.zone.local('2019-09-11 07:34:50') }
    read { content }
  end
end
