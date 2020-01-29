# frozen_string_literal: true

# Book exbition event(like '技術書典6')
class Event < ApplicationRecord
  has_many :authors, through: :event_authors
  has_many :books, through: :event_books
end
