class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.bigint :tweet_id
      t.bigint :user_id
      t.string :text
      t.string :url
      t.text :row

      t.timestamps
    end
    add_index :tweets, :tweet_id
    add_index :tweets, :user_id
    add_index :tweets, :text
  end
end
