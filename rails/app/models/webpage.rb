# frozen_string_literal: true

# webpage cache downloaded from web.
class Webpage < ApplicationRecord
  def self.create_from_page_datum(request_uri, page_datum, accessed_at: Time.zone.now)
    new_from_page_datum(request_uri, page_datum, accessed_at: accessed_at).save!
  end

  def self.new_from_page_datum(request_uri, page_datum, accessed_at: Time.zone.now)
    new_from_openuri_meta(page_datum) do |object|
      object.content = page_datum.read
      object.request_uri = request_uri
      object.accessed_at = accessed_at
    end
  end

  def self.new_from_openuri_meta(meta)
    new do |object|
      # TODO: implement content_encoding.
      %w[base_uri charset content_type last_modified].each do |property|
        object.send("#{property}=", meta.send(property))
      end
      yield object if block_given?
    end
  end
end
