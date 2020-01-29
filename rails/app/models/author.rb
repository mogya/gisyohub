# frozen_string_literal: true

# book author
class Author < ApplicationRecord
  belongs_to :twitter_user
  has_many :books, through: :book_authors
  has_many :events, through: :event_authors
end
