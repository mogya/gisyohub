# frozen_string_literal: true

class FixTypoRowRaw < ActiveRecord::Migration[6.0]
  def change
    rename_column :tweets, :row, :raw
    rename_column :twitter_users, :row, :raw
  end
end
