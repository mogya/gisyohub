# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'register method' do
    describe 'without existing record' do
      it 'create new record and it has correct parameters' do
        expect do
          Book.register(
            title: 'existing_book',
            keyword: '#keyword1'
          )
        end.to change { Book.count }.by(1)

        book = Book.find_by(title: 'existing_book')
        expect(book&.keyword).to eq '#keyword1'
      end
    end

    describe 'with existing record' do
      before do
        create(
          :book,
          title: 'existing_book',
          keyword: '#keyword1'
        )
      end
      it 'do not create new record' do
        expect do
          Book.register(
            title: 'existing_book',
            keyword: '#keyword_new'
          )
        end.to change { Book.count }.by(0)

        book = Book.find_by(title: 'existing_book')
        expect(book&.keyword).to eq '#keyword_new'
      end
    end
  end
end
