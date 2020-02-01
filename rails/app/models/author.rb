# frozen_string_literal: true

# book author
class Author < ApplicationRecord
  belongs_to :twitter_user
  belongs_to :user
  has_many :books, through: :book_authors
  has_many :events, through: :event_authors
end
