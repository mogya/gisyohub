class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.bigint :tweet_id, null: false
      t.bigint :user_id, null: false
      t.string :text, null: false
      t.text :row, null: false

      t.datetime :tweeted_at, null: false
      t.timestamps
    end
    add_index :tweets, :tweet_id
    add_index :tweets, :user_id
    add_index :tweets, :text
    add_index :tweets, :updated_at
  end
end
