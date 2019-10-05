# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Webpage, type: :model do
  describe 'new_from_openuri_meta' do
    let(:page_datum) { build(:webpage_datum) }
    subject { Webpage.new_from_openuri_meta(page_datum) }

    it 'all metadata map to object' do
      expect(subject.base_uri).to eq page_datum.base_uri.to_s
      expect(subject.charset).to eq page_datum.charset
      # TODO: implement content_encoding.
      # expect(subject.content_encoding).to eq page_datum.content_encoding
      expect(subject.content_type).to eq page_datum.content_type
      expect(subject.last_modified).to eq page_datum.last_modified
    end
  end

  describe 'new_from_page' do
    let(:uri) { 'http://example.com/' }
    let(:time) { Time.zone.local(2019, 1, 2) }
    let(:content) { '<html></html>' }
    let(:page_datum) do
      build(
        :webpage_datum,
        content: content
      )
    end
    subject do
      Webpage.new_from_page_datum(
        uri,
        page_datum,
        accessed_at: time
      )
    end

    it 'all data map to object' do
      expect(subject.content).to eq content
      expect(subject.request_uri).to eq uri
      expect(subject.accessed_at).to eq time
      expect(subject.new_record?).to be_truthy
    end
  end

  describe 'create_from_page' do
    let(:uri) { 'http://example.com/' }
    let(:time) { Time.zone.local(2019, 1, 2) }
    let(:content) { '<html></html>' }
    let(:page_datum) do
      build(
        :webpage_datum,
        content: content
      )
    end
    subject do
      Webpage.create_from_page_datum(
        uri,
        page_datum,
        accessed_at: time
      )
    end

    it 'all data map to object' do
      expect { subject }.to change { Webpage.count }.from(0).to(1)
    end
  end
end
