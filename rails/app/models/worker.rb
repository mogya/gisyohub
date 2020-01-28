# frozen_string_literal: true

# gisyohub working persons
class Worker < ApplicationRecord
  belongs_to :user
  has_many :assignment_logs
end
