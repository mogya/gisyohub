# frozen_string_literal: true

class ChangeTweetTextType < ActiveRecord::Migration[6.0]
  def change
    remove_index :tweets, :text
    change_column :tweets, :text, :text
    # TODO: Just remove index due to key length limit. We can use N-Gram index if need. 
  end
end
