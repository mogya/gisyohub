# frozen_string_literal: true

# log of workers assigning tweet to book/event/author 
class AssignmentLog < ApplicationRecord
  belongs_to :worker
  belongs_to :tweet
  belongs_to :book
  belongs_to :event
  belongs_to :author
end
