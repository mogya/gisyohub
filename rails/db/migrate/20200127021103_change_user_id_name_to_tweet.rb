# frozen_string_literal: true

# change_column since user_id seems like foreign key of User model
#   (actually it's foreign key for TwitterUser model)
class ChangeUserIdNameToTweet < ActiveRecord::Migration[6.0]
  def change
    rename_column :tweets, :user_id, :twitter_user_id
  end
end
