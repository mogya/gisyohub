# frozen_string_literal: true

# (Gisyohub's target)book
class Book < ApplicationRecord
  has_many :authors, through: :book_authors
  has_many :events, through: :event_books

  # register a book. if the book is already exists, updates remaining columns.
  # params: title
  # params: keyword
  def self.register(**params)
    raise ArgumentError('title is mandatory parameter.') if params[:title].nil?

    book = first_or_create!(title: params[:title])
    book.keyword = params[:keyword] || book.keyword
    book.save!
  end
end
